class GymsController < ApplicationController
  def index
    @gyms = Gym.order(:id)
    @gyms.each do |gym|
      update_gym(gym)
    end
  end

  def show
    find_gym
    update_gym(@gym)
  end

  def challenge
    find_gym
    @pokemon_choice = Pokemon.find(params["challenger"]["pokemons"])
    if current_trainer.poke_tokens < 5
      flash[:message] = "You do not have enough Poke-Tokens to challenge this gym"

      redirect_to gym_path(@gym)
    elsif @pokemon_choice.occupied
      flash[:message] = "#{@pokemon_choice.name} is already performing an action"

      redirect_to gym_path(@gym)
    else
      flash[:message] = "You challenged the #{@gym.name} City Gym!"
      @pokemon_choice.update(occupied: true)
      current_trainer.minus_token(5)
      @gym.update(challenger_id: current_trainer.id, challenger_pokemon_id: @pokemon_choice.id, challenge_time: Time.now)

      redirect_to gym_path(@gym)
    end
  end

  def results
    find_gym
    update_gym(@gym)
    @challenge_history = @gym.challenges.order(created_at: :desc)
    @last_challenge = @gym.challenges.order(created_at: :desc).first
  end

  private

  def find_gym
    @gym = Gym.find(params[:id])
    @gym_leader = @gym.gym_leader
    @gym_pokemon = @gym.gym_pokemon
  end

  def update_gym(gym)
    if gym.challenged? && gym.challenge_over? && gym.grace_over?
      gym.gym_results
    elsif gym.challenged? && gym.challenge_over?
      gym.find_winner
    end
  end
end

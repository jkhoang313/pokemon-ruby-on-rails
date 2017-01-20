class GymsController < ApplicationController
  def index
    @gyms = Gym.order(:id)
  end

  def show
    find_gym
    # earn poketokens for longer you hold a gym
  end

  def challenge
    find_gym
    if current_trainer.poke_tokens < 5
      flash[:message] = "You do not have enough Poke-Tokens to challenge this gym"

      redirect_to gym_path(@gym)
    else
      flash[:message] = "You challenged the #{@gym.name} City Gym!"
      @pokemon_choice = Pokemon.find(params["challenger"]["pokemon"])
      # @pokemon_choice.update(occupied: true)
      # changes order of pokemon
      current_trainer.minus_token(5)

      @gym.update(challenger_id: current_trainer.id, challenger_pokemon: @pokemon_choice.id)

      redirect_to gym_path(@gym)
    end
  end

  def results
  end

  private

  def find_gym
    @gym = Gym.find(params[:id])
    @gym_leader = @gym.gym_leader
    @gym_pokemon = @gym.gym_pokemon
    if @gym.challenged?
      @challenger = Trainer.find(@gym.challenger_id)
      @challenger_pokemon = Pokemon.find(@gym.challenger_pokemon)
    end
  end
end

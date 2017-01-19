class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    find_gym
  end

  def challenge
    find_gym
    if @gym.challenger_id
      flash[:message] = "Cannot challenge this gym, it is currently being challenged"
      redirect_to gym_path(@gym)
    else
      render :'gyms/challenge'
    end
  end

  def battle
    # check to see if enough poketokens
  end

  private

  def find_gym
    @gym = Gym.find(params[:id])
    @gym_leader = @gym.gym_leader
    @gym_pokemon = @gym.gym_pokemon
  end
end

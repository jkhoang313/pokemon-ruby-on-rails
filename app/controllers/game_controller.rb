class GameController < ApplicationController
  def search
    @search = Trainer.search(params[:search])
    flash[:message] = "No Trainer Matches Your Search" if @search.empty?
    render :'game/search'
    flash.clear
    # same problem as pokemon capture
  end

  def get_search
    redirect_to root_path
  end

  def train
    if logged_in?
      @status = current_trainer.training_pokemon ? "In Use" : "Open"
    else
      redirect_to root_path
    end
  end

  def training
    @pokemon = Pokemon.find(params["trainer"]["pokemons"])
    if @pokemon.occupied
      flash[:message] = "#{@pokemon.name} is already performing an action"
    else
      current_trainer.update(training_pokemon_id: @pokemon.id, training_start: Time.now.to_i)
      @pokemon.update(occupied: true)
    end

    redirect_to train_path
  end
end

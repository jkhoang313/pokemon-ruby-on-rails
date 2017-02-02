class GameController < ApplicationController
  def search
    @search = Trainer.search(params[:search])
    flash[:message] = "No Trainer Matches Your Search" if @search.empty?
    render :'game/search'
    flash.clear
  end

  def get_search
    redirect_to root_path
  end

  def training
    if logged_in?
      @status = current_trainer.training_pokemon ? "In Use" : "Open"
      @pokemon = current_trainer.training_pokemon
    else
      redirect_to root_path
    end
  end

  def start_training
    @pokemon = Pokemon.find(params["trainer"]["pokemons"])
    if @pokemon.occupied
      flash[:message] = "#{@pokemon.name} is already performing an action"
    elsif current_trainer.poke_tokens < 3
      flash[:message] = "You don't have enough Poke-tokens"
    else
      current_trainer.minus_token(3)
      current_trainer.update(training_pokemon_id: @pokemon.id, training_start: Time.now.to_i)
      @pokemon.update(occupied: true)
    end

    redirect_to training_path
  end

  def remove_training
    if current_trainer.training_time_passed?
      flash[:message] = current_trainer.training_pokemon.action("train")
      current_trainer.update(training_pokemon_id: nil)
    end
    redirect_to training_path
  end

  def contest
    if logged_in?
      @status = current_trainer.contest_pokemon ? "In Use" : "Open"
      @pokemon = current_trainer.contest_pokemon
    else
      redirect_to root_path
    end
  end

  def start_contest
    @pokemon = Pokemon.find(params["trainer"]["pokemons"])
    if @pokemon.occupied
      flash[:message] = "#{@pokemon.name} is already performing an action"
    elsif current_trainer.poke_tokens < 3
      flash[:message] = "You don't have enough Poke-tokens"
    else
      current_trainer.minus_token(3)
      current_trainer.update(contest_pokemon_id: @pokemon.id, contest_start: Time.now.to_i)
      @pokemon.update(occupied: true)
    end

    redirect_to contest_path
  end

  def remove_contest
    if current_trainer.contest_time_passed?
      flash[:message] = current_trainer.contest_pokemon.action("contest")
      current_trainer.update(contest_pokemon_id: nil)
    end
    redirect_to contest_path
  end

  def daycare
    if logged_in?
      @status = current_trainer.daycare_pokemon ? "In Use" : "Open"
      @pokemon = current_trainer.daycare_pokemon
    else
      redirect_to root_path
    end
  end

  def start_daycare
    @pokemon = Pokemon.find(params["trainer"]["pokemons"])
    if @pokemon.occupied
      flash[:message] = "#{@pokemon.name} is already performing an action"
    elsif current_trainer.poke_tokens < 3
      flash[:message] = "You don't have enough Poke-tokens"
    else
      current_trainer.minus_token(3)
      current_trainer.update(daycare_pokemon_id: @pokemon.id, daycare_start: Time.now.to_i)
      @pokemon.update(occupied: true)
    end

    redirect_to daycare_path
  end

  def remove_daycare
    if current_trainer.daycare_time_passed?
      flash[:message] = current_trainer.daycare_pokemon.action("daycare")
      current_trainer.update(daycare_pokemon_id: nil)
    end
    redirect_to daycare_path
  end
end

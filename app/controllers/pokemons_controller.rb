class PokemonsController < ApplicationController
  def index
    find_trainer
  end

  def show
    find_trainer
    @index = params[:pokemon_id].to_i
    if @index <= 6
    @pokemon = @trainer.starters.order(:id)[params[:pokemon_id].to_i-1]
    else
      @pokemon = @trainer.storage.order(:id)[params[:pokemon_id].to_i-7]
    end
  end

  def destroy
    find_trainer
    @index = params[:pokemon_id].to_i
    if @index <= 6
    @pokemon = @trainer.starters.order(:id)[params[:pokemon_id].to_i-1]
    else
      @pokemon = @trainer.storage.order(:id)[params[:pokemon_id].to_i-7]
    end

    if @pokemon.occupied == true
      flash[:message] = "#{@pokemon.name} is currently performing an action, cannot release"

      redirect_to pokemon_path(@trainer, @index)
    elsif @trainer.pokemons.count == 1
      flash[:message] = "You can't release your last Pokemon!"

      redirect_to pokemon_path(@trainer, @index)
    elsif @pokemon == @trainer.leading_pokemon
      flash[:message] = "Cannot release leading pokemon"

      redirect_to pokemon_path(@trainer, @index)
    else
      flash[:message] = "Released #{@pokemon.name} into the wild...."
      @pokemon.destroy

      redirect_to pokemons_path(@trainer)
    end
  end
end

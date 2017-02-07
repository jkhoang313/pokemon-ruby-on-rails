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
    if current_trainer == @trainer
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
      end
      redirect_to pokemons_path(@trainer)
    end
  end

  def transfer
    find_trainer
    if current_trainer == @trainer
      if params["trainer"]["starters"]
        transfer_starter
      elsif params["trainer"]["storage"]
        transfer_storage
      end
    end
    redirect_to pokemons_path(@trainer)
  end

  def transfer_starter
    @starter = Pokemon.find(params["trainer"]["starters"])
    if @starter.occupied
      flash[:message] = "#{@starter.name} is occupied, unable to transfer"
    elsif @starter == current_trainer.leading_pokemon
      flash[:message] = "Unable to transfer Lead Pokemon"
    else
      flash[:message] = "Transfered #{@starter.name} to storage"
      @starter.update(group: "storage")
    end
  end

  def transfer_storage
    @storage = Pokemon.find(params["trainer"]["storage"])
    if current_trainer.starters.count == 6
      flash[:message] = "Transfer failed, current team is full"
    else
      flash[:message] = "Transfered #{@storage.name} to current team"
      @storage.update(group: "starters")
    end
  end

  def evolve
    @index = params[:pokemon_id].to_i - 1
    if @index <= 5
      @pokemon = current_trainer.starters[@index]
    else
      @pokemon = current_trainer.storage[@index]
    end

    if !(@pokemon.evolution && @pokemon.level >= 6) || (@pokemon.evolution && @pokemon.evolution.evolution && @pokemon.level >= 3)
      redirect_to trainer_path(current_trainer)
    end
  end

  def evolved
    @index = params[:pokemon_id].to_i - 1
    if @index <= 5
      @pokemon = current_trainer.starters[@index]
    else
      @pokemon = current_trainer.storage[@index]
    end

    if !(@pokemon.evolution && @pokemon.level >= 6) || (@pokemon.evolution && @pokemon.evolution.evolution && @pokemon.level >= 3)
      redirect_to trainer_path(current_trainer)
    else
      @old_pokemon = @pokemon.name
      @pokemon.evolve
    end
  end
end

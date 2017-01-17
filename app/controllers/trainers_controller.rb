class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    #fix random starter pokemon or make main pokemon column
    if @trainer.valid? && @trainer.authenticate(params[:trainer][:password_confirmation])
      @starter = Pokedex.starter_pokemon(params[:trainer][:starter_pokemon])
      @trainer.create_conditions(@starter)
      session[:trainer_id] = @trainer.id
      flash[:message] = "Welcome to Pokemon Ruby-On-Rails Trainer #{@trainer.name}!"

      redirect_to trainer_path(@trainer)
    else
      flash[:message] = @trainer.errors.full_messages.first

      redirect_to new_trainer_path
    end
  end

  def destroy
    find_trainer
    delete_pokemon
    @trainer.destroy
    session.clear
    flash[:message] = "You have left Pokemon Ruby-On-Rails :("
    #change message

    redirect_to trainers_path
  end

  def show
    find_trainer
  end

  def edit
    find_trainer
  end

  def update
    find_trainer
    @trainer.update(name: params[:trainer][:name], age: params[:trainer][:age])
    flash[:message] = "Trainer profile successfully updated"

    redirect_to trainer_path(@trainer)
  end

  def claim_token
    find_trainer
    @trainer.claim_token
    flash[:message] = "Claimed Poke-Token"

    redirect_to trainer_path(@trainer)
  end

  def run_away
    flash[:message] = "Got away safely..."

    redirect_to trainer_path(current_trainer)
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :email, :password, :password_confirmation, :age, :gender, :starter_pokemon)
  end

  def find_trainer
    @trainer = Trainer.find(params[:id])
  end

  def delete_pokemon
    @trainer.pokemons.each do |pokemon|
      pokemon.destroy
    end
  end
end

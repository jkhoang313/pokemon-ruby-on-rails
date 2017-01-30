class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all.order(:id)
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.valid? && @trainer.authenticate(params[:trainer][:password_confirmation])
      @starter = Pokedex.starter_pokemon(params[:trainer][:leading_pokemon_id].to_i)
      @trainer.create_conditions(@starter)
      session[:trainer_id] = @trainer.id
      flash[:message] = "Welcome to Pokemon Ruby-On-Rails Trainer #{@trainer.name}!"

      redirect_to trainer_path(@trainer)
    else
      flash[:message] = @trainer.errors.full_messages.first

      redirect_to signup_path
    end
  end

  def destroy
    find_trainer
    delete_pokemon
    @trainer.destroy
    session.clear
    flash[:message] = "You have left Pokemon Ruby-On-Rails"

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
    @trainer.update(trainer_params)
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

  def change_lead
    current_trainer.update(leading_pokemon_id: params["trainer"]["starters"])

    redirect_to trainer_path(current_trainer)
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :email, :password, :password_confirmation, :age, :gender, :leading_pokemon_id)
  end

  def delete_pokemon
    @trainer.pokemons.each do |pokemon|
      pokemon.destroy
    end
  end
end

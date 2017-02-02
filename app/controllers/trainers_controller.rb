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
      @starter = Pokedex.find(params[:trainer][:leading_pokemon_id].to_i)
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
    if current_trainer == Trainer.find(params[:id])
      find_trainer
      @trainer.destroy
      session.clear
      flash[:message] = "You have left Pokemon Ruby-On-Rails"

      redirect_to signup_path
    else
      redirect_to trainer_path(current_trainer)
    end
  end

  def show
    find_trainer
  end

  def edit
    if current_trainer == Trainer.find(params[:id])
      find_trainer
    else
      redirect_to trainer_path(current_trainer)
    end
  end

  def update
    if current_trainer == Trainer.find(params[:id])
      find_trainer
      # can't update age
      @trainer.update(trainer_params)
      flash[:message] = "Trainer profile successfully updated"
    end
    redirect_to trainer_path(@trainer)
  end

  def claim_token
    if current_trainer.token_time_passed?
      find_trainer
      @trainer.claim_token
      flash[:message] = "Claimed 3 Poke-Tokens"
    end
    redirect_to trainer_path(current_trainer)
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
end

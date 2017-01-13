class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if params[:trainer][:starter_pokemon] == "Random"
      @starter = Pokedex.find_by(name: Trainer.random_starter)
    else
      @starter = Pokedex.find_by(name: params[:trainer][:starter_pokemon])
    end
    if @trainer.authenticate(params[:trainer][:password_confirmation])
      @trainer.save
      @trainer.pokemons << @starter.create_pokemon(@trainer)

      session[:trainer_id] = @trainer.id

      redirect_to trainer_path(@trainer)
    else
      flash[:message] = "Password confirmation must match password"
      redirect_to new_trainer_path
      # add validations and flash message
    end
    # don't create if it has errors
    # get rid of starter_pokemon attribute
  end

  def destroy
    find_trainer
    @trainer.destroy
    session.clear
    # put in method in application?

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

    redirect_to trainer_path(@trainer)
  end

  def reset_token
    find_trainer
    @trainer.add_token

    render :'trainers/show'
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :password, :age, :gender)
  end

  def find_trainer
    @trainer = Trainer.find(params[:id])
  end
end

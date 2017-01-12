class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.authenticate(params[:trainer][:password_confirmation])
      @trainer.save
      @pokemon_base = Pokedex.find_by(name: params[:trainer][:starter_pokemon])
      @trainer.pokemons << @pokemon_base.create_pokemon(@trainer)

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
    # ask user for confirmation
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    session.clear
    # put in method in application?

    redirect_to trainers_path
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def edit
    @trainer = Trainer.find(params[:id])
  end

  def update
    @trainer = Trainer.find(params[:id])
    @trainer.update(name: params[:trainer][:name], age: params[:trainer][:age])

    redirect_to trainer_path(@trainer)
  end

  def reset_token
    @trainer = Trainer.find(params[:id])
    @trainer.add_token

    render :'trainers/show'
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :password, :age, :gender, :starter_pokemon)
  end
end

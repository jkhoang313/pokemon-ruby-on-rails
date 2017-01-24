class SessionsController < ApplicationController
  def create
    @trainer = Trainer.find_by(email: params[:email].downcase)
    if @trainer && @trainer.authenticate(params[:password])
      session[:trainer_id] = @trainer.id

      redirect_to trainer_path(@trainer)
    else
      flash[:message] = "Incorrect Email or Password"

      redirect_to login_path
    end
  end

  def destroy
    session.clear

    redirect_to login_path
  end
end

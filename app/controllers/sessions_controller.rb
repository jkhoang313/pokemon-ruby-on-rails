class SessionsController < ApplicationController
  def create
    @trainer = Trainer.find_by(name: capitalize_name(params[:trainer][:name]))
    if @trainer && @trainer.authenticate(params[:trainer][:password])
      # flash notice for login failures
      session[:trainer_id] = @trainer.id
      redirect_to trainer_path(@trainer)
    else
      flash[:message] = "Incorrect Name or Password"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  def capitalize_name(name)
    name.downcase.split.collect(&:capitalize).join(' ') if name && !name.blank?
  end
end

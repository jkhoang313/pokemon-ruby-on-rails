class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_trainer, :logged_in?

  def current_trainer
    Trainer.find(session[:trainer_id]) if logged_in?
  end

  def logged_in?
    session[:trainer_id]
  end
end

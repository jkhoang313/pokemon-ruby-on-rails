class BattlesController < ApplicationController
  def index

  end

  def battle_challenge
    redirect_to battle_path
  end
end

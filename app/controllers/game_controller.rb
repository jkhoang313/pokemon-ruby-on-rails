class GameController < ApplicationController
  def search
    @search = Trainer.search(params[:search])
    flash[:message] = "No Trainer Matches Your Search" if @search.empty?
    render :'game/search'
    flash.clear
    # same problem as pokemon capture
  end
end

class PokedexController < ApplicationController
  def index
    @pokedex = Pokedex.all
  end

  def show
    @pokemon = Pokedex.find(params[:id])
  end
end

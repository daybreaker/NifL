class SeasonsController < ApplicationController
  def index
    @weeks = Season.current.games
  end
end

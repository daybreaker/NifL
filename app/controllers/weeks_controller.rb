class WeeksController < ApplicationController
  def show
    @week = Week.includes( games: [:away_team, :home_team] ).find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => {week: @week, games: @week.games.collect{|game| [game, game.teams]} }.to_json }
    end
  end

  
end

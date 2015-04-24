class SeasonsController < ApplicationController
  def show
    @season = Season.includes(weeks: { games: [:away_team, :home_team] }).find(params[:id])
    weeks = @season.weeks.collect{|week| {week: week, games: week.games.collect{|game| {game_info: game, teams: game.teams} } } }
    respond_to do |format|
      format.html
      format.json { render :json => {season: @season, weeks: weeks }.to_json }
    end
  end
end

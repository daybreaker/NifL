class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
    respond_to do |format|
      format.html
      format.json { render :json => @seasons.to_json }
    end
  end

  def show
    @season = Season.all_includes.find_by(year: params[:year]) if params[:year]

    respond_to do |format|
      format.html
      format.json do
        weeks = @season.weeks.collect do |week|
          {
            week: week,
            games: week.games.collect do |game|
              { game_info: game, teams: game.teams, pick: game.user_pick }
            end
          }
        end
        render :json => {season: @season, weeks: weeks }.to_json
      end
    end
  end
end

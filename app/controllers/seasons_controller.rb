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
        render :json => @season.to_json
      end
    end
  end
end

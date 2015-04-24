class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @seasons = Season.all
    respond_to do |format|
      format.html
      format.json { render :json => @seasons.to_json }
    end
  end
end

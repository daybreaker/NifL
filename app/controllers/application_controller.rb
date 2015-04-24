class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_season
  before_filter :find_picks

  def set_season
    @season = Season.includes(weeks: :games).current
  end

  def find_picks
    @picks = Pick.where(:user_id => current_user.id).includes(:game => :week).where(weeks: {season_id:@season.id}) if current_user
  end
end

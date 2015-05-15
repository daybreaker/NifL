class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_season
  before_filter :find_picks, if: :signed_in

  def set_season
    @season = Season.includes(weeks: [:games, :byes]).current
  end

  def find_picks
    @picksets = Pickset.where(user_id: current_user.id, season_id: @season.id)
  end

  def signed_in
    user_signed_in?
  end

  def current_ability
    @current_ability ||= ::Ability.new(current_user)
  end
end

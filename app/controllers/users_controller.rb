class UsersController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    @games_by_week = Game.includes(:week).where(weeks: {season_id:@season.id}).group_by{|x| x.week.number}
  end
end

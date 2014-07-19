class PicksController < ApplicationController
  def create
    pick = Pick.new( pick_params )
    pick.game.picks.each{|x| x.status = 'inactive'; x.save }
    pick.status = "active"
    pick.save
    render pick.game, :content_type => 'text/html'
  end

  private
  def pick_params
    params.fetch(:pick, {}).permit(:user_id, :game_id, :winning_team_id, :losing_team_id, :status)
  end
end

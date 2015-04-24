class PicksController < ApplicationController
 skip_before_action :verify_authenticity_token
  
  def create
    puts params
    game = Game.find(params[:game_id])
    winning_team_id = params[:team_id]
    losing_team_id = game.teams.reject{|y| y.id == winning_team_id}
    pick = Pick.new( {game_id: game.id, winning_team_id: winning_team_id, losing_team_id: losing_team_id, user_id: current_user.id } )
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

class PicksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    game = Game.find(params[:game_id])
    winning_team_id = params[:team_id]
    losing_team_id = game.teams.reject{|y| y.id == winning_team_id}

    if losing_team_id.blank?
      flash[:notice] = "There was an error making your pick. Please try again"
      redirect_to game.week
    end

    pick = Pick.new( {game_id: game.id, winning_team_id: winning_team_id, losing_team_id: losing_team_id, user_id: current_user.id } )

    # Invalidate the user's previous picks for this game
    pick.game.user_picks.each{|x| x.status = 'inactive'; x.save }

    # Set current pick as the active one
    pick.status = "active"
    if pick.save
      # @TODO: Probably some json response.
      #render pick.game, :content_type => 'text/html'
    else
      flash[:notice] = "There was an error making your pick. Please try again"
      redirect_to game.week
    end
  end

  private
  def pick_params
    params.fetch(:pick, {}).permit(:user_id, :game_id, :winning_team_id, :losing_team_id, :status)
  end
end

class Pick < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  belongs_to :losing_team, :class_name => "Team", :foreign_key => :losing_team_id
  belongs_to :winning_team, :class_name => "Team", :foreign_key => :winning_team_id
  belongs_to :made_before_week, :class_name => "Week", :foreign_key => :made_before_week
  
  def for_team?(game, team)
    game_id == game.id && winning_team_id == team.id && status == "active"
  end
end

class Pick < ActiveRecord::Base
  attr_accessible :losing_score, :winning_score, :losing_team, :winning_team, :losing_team, :game_id

  belongs_to :losing_team, :class_name => "Team", :foreign_key => :losing_team  
  belongs_to :winning_team, :class_name => "Team", :foreign_key => :winning_team
  belongs_to :user
  belongs_to :game
  belongs_to :made_before_week, :class_name => "Week", :foreign_key => :made_before_week
end

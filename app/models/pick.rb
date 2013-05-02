class Pick < ActiveRecord::Base
  attr_accessible :current_spread, :losing_score, :winning_score

  belongs_to :losing_team, :class_name => "Team", :foreign_key => :losing_team  
  belongs_to :winning_team, :class_name => "Team", :foreign_key => :winning_team
  belongs_to :user
end

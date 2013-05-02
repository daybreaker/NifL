class Game < ActiveRecord::Base
  attr_accessible :away_team_id, :home_team_id, :spread, :week_id

  belongs_to :pick
  belongs_to :week
  belongs_to :away_team, :class_name => "Team", :foreign_key => :away_team_id
  belongs_to :home_team, :class_name => "Team", :foreign_key => :home_team_id
  

  def other_team(this_team)
    [home_team, away_team].detect{|x| x.id != this_team.id}
  end  
end

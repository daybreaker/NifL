class Game < ActiveRecord::Base
  has_many :picks
  belongs_to :away_team, :class_name => "Team", :foreign_key => :away_team_id
  belongs_to :home_team, :class_name => "Team", :foreign_key => :home_team_id
  belongs_to :week

  def teams
    [home_team, away_team]
  end
end

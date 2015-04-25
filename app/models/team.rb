# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  city       :string(255)
#  name       :string(255)
#  abbr       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  has_many :byes
  has_many :home_games, :class_name => "Game", :foreign_key => :home_team_id
  has_many :away_games, :class_name => "Game", :foreign_key => :away_team_id

  def games(season: nil, include_byes: true)
    if season
      g = home_games.where("weeks.season_id = ?",1) + away_games.where("weeks.season_id = ?",1) + ( include_byes ? byes.where("weeks.season_id = ?",1) : [] )
    else
      g = home_games + away_games + ( include_byes ? byes : [] )
    end
    g.sort_by{|x| x.week.number}
  end

  def opponents
    games(include_byes: false).collect{|x| x.other_team(self)}
  end
end

class Team < ActiveRecord::Base
  attr_accessible :abbr, :city, :mascot

  has_many :byes
  has_many :home_games, :class_name => "Game", :foreign_key => :home_team_id
  has_many :away_games, :class_name => "Game", :foreign_key => :away_team_id

  def games(season = nil)
    if season
      g = home_games.where("weeks.season_id = ?",1) + away_games.where("weeks.season_id = ?",1) + byes.where("weeks.season_id = ?",1)
    else
      g = home_games + away_games + byes
    end
    g.sort_by{|x| x.week.number}
  end

  def opponents
    games.collect{|x| x.other_team(self)}
  end
end

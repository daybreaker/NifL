class Season < ActiveRecord::Base
  has_many :weeks

  def self.current
    find_by(:year => 2015)
  end

  def all_includes
    includes(weeks: { games: [:away_team, :home_team] })
  end

  def games
    weeks.map{|w| [w.number, w.games.sort{|x,y| x.home_team.abbr <=> y.home_team.abbr}] }
  end
end

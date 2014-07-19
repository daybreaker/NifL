class Season < ActiveRecord::Base
  has_many :weeks
  
  def self.current
    where(:year => 2013).first
  end
  
  def games
    weeks.map{|w| [w.number, w.games.sort{|x,y| x.home_team.abbr <=> y.home_team.abbr}] }
  end
end

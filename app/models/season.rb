class Season < ActiveRecord::Base
  attr_accessible :year

  has_many :weeks
  
  def self.current
    where(:year => 2013).first
  end
  
  def games
    weeks.map{|x| [x.number, x.games.sort{|x,y| x.home_team.abbr <=> y.home_team.abbr}] }
  end
end

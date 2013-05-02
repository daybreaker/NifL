class Week < ActiveRecord::Base
  attr_accessible :number, :season_id

  has_many :byes
  has_many :games
  belongs_to :season
end

class Week < ActiveRecord::Base
  has_many :games
  has_many :byes
  belongs_to :season
end

class Week < ActiveRecord::Base
  has_many :games
  belongs_to :season
end

class Bye < ActiveRecord::Base
  attr_accessible :week_id, :team_id

  belongs_to :season
  belongs_to :week
  belongs_to :team
end

# == Schema Information
#
# Table name: byes
#
#  id         :integer          not null, primary key
#  week_id    :integer
#  team_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Bye < ActiveRecord::Base
  belongs_to :week
  belongs_to :team

  def other_team(team)
    "Bye Week -- Week #{week.number}"
  end

  def team_abbr
    team.abbr
  end
end

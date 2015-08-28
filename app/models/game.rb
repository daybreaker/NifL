# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  home_team_id :integer
#  away_team_id :integer
#  spread       :string(255)
#  week_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#
class Game < ActiveRecord::Base
  has_many :picks
  belongs_to :away_team, class_name: "Team", foreign_key: :away_team_id
  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id
  belongs_to :week

  delegate :number, to: :week, prefix: true

  def teams
    [home_team, away_team]
  end

  def other_team(team)
    teams - [team]
  end

  def user_picks(user = nil)
    return false if user.blank?
    picks.where(user: user)
  end

  def user_pick(user = nil)
    return false if user.blank?
    user_picks(user).find_by(status: 'active')
  end

  def react_view
    { home_team: home_team, away_team: away_team, week: week }
  end
end

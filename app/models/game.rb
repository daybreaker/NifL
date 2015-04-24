class Game < ActiveRecord::Base
  has_many :picks
  belongs_to :away_team, :class_name => "Team", :foreign_key => :away_team_id
  belongs_to :home_team, :class_name => "Team", :foreign_key => :home_team_id
  belongs_to :week

  def teams
    [home_team, away_team]
  end

  def user_picks(user = current_user)
    return false if user.blank?
    picks.where(user: user)
  end

  def user_pick(user = current_user)
    return false if user.blank?
    user_picks(user).find_by(status: 'active')
  end
end

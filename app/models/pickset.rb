# == Schema Information
#
# Table name: picksets
#
#  id        :integer          not null, primary key
#  season_id :integer
#  user_id   :integer
#  name      :string(255)
#
class Pickset < ActiveRecord::Base
  belongs_to :user
  belongs_to :season
  has_many :picks

  accepts_nested_attributes_for :picks, allow_destroy: true

  def wins_for(team)
    picks.where(winning_team_id: team.id).count
  end

  def losses_for(team)
    picks.where(losing_team_id: team.id).count
  end

  def user_picks(user_id = current_user.id)
    picks.where(user: user_id)
  end
end

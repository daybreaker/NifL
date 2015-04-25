# == Schema Information
#
# Table name: picks
#
#  id                  :integer          not null, primary key
#  winning_team_id     :integer
#  losing_team_id      :integer
#  winning_score       :integer
#  losing_score        :integer
#  current_spread      :string(255)
#  game_id             :integer
#  user_id             :integer
#  made_before_week_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#  status              :string(255)
#

class Pick < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_one :losing_team, :class_name => "Team", :foreign_key => :losing_team_id
  has_one :winning_team, :class_name => "Team", :foreign_key => :winning_team_id
  belongs_to :made_before_week, :class_name => "Week", :foreign_key => :made_before_week

  def for_team?(game, team)
    game_id == game.id && winning_team_id == team.id && status == "active"
  end
end

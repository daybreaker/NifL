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
#  pickset_id          :integer
#

require 'spec_helper'

describe Pick do
  pending "add some examples to (or delete) #{__FILE__}"
end

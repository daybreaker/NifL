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

require 'spec_helper'

describe Game do
  pending "add some examples to (or delete) #{__FILE__}"
end

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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pick do
    winning_team_id 1
    losing_team_id 1
    winning_score 1
    losing_score 1
    current_spread "MyString"
    game nil
    user nil
    made_before_week_id 1
  end
end

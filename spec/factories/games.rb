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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    home_team_id 1
    away_team_id 1
    spread "MyString"
    week nil
  end
end

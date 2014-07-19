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

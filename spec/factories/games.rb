# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    home_team_id 1
    home_team "MyString"
    away_team_id 1
    away_team "MyString"
    spread "MyString"
    references ""
    references ""
  end
end

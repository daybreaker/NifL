# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pick do
    winning_team 1
    losing_team 1
    winning_score 1
    losing_score 1
    current_spread "MyString"
    references ""
  end
end

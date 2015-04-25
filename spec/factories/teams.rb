# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  city       :string(255)
#  name       :string(255)
#  abbr       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    city "MyString"
    name "MyString"
    abbr "MyString"
  end
end

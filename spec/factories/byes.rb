# == Schema Information
#
# Table name: byes
#
#  id         :integer          not null, primary key
#  week_id    :integer
#  team_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bye do
    week nil
    team nil
  end
end

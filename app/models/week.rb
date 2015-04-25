# == Schema Information
#
# Table name: weeks
#
#  id         :integer          not null, primary key
#  number     :integer
#  season_id  :integer
#  created_at :datetime
#  updated_at :datetime
#
class Week < ActiveRecord::Base
  has_many :games
  has_many :byes
  belongs_to :season
end

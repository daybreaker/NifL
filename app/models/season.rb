class Season < ActiveRecord::Base
  attr_accessible :year

  has_many :weeks

end

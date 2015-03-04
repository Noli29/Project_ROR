class Role < ActiveRecord::Base
  attr_accessible :name

  has_one :users
end

class Role < ActiveRecord::Base
  attr_accessible :name

  has_one :admin
  has_one :user
end

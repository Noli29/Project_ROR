class Role < ActiveRecord::Base
  attr_accessible :name

  belongs_to :admin
  belongs_to :user
end

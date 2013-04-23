class User < ActiveRecord::Base
  attr_accessible :about, :email, :location, :name
  validates :name, :presence => true
  has_many :imgs
end

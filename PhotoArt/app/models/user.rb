class User < ActiveRecord::Base
  attr_accessible :about, :email, :location, :name, :username, :password, :password_confirmation
  validates :name, :presence => true
  acts_as_authentic
  has_many :imgs
end

class Addfields < ActiveRecord::Base
  attr_accessible :crypted_password, :password_salt, :persistence_token, :username, :password, :password_confirmation
  acts_as_authentic
end

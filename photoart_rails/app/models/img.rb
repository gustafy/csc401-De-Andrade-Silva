class Img < ActiveRecord::Base
  attr_accessible :description, :public, :user_id
  attr_accessible :pic
  belongs_to :users
  has_attached_file :pic, :styles => 
           { :medium => "300x300>", :thumb => "100x100>" }
end
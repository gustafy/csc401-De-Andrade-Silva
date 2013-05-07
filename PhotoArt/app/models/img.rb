class Img < ActiveRecord::Base
  attr_accessible :description, :public, :user_id, :pic
  belongs_to :user
  has_attached_file :pic, :styles => 
           { :front => "240x300>", :medium => "240x300>", :thumb => "100x100>" }
  
end
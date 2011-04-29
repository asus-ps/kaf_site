class Article < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title
  validates_length_of :title, :maximum => 255
  validates_presence_of :body
  
end

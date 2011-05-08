class Article < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title  
  validates_presence_of :body
  validates_presence_of :created_at
  validates_length_of :title, :maximum => 255
  validates_length_of :image, :maximum => 255
  validates_format_of :image, :allow_blank => true, :with =>%r{\.(gif|jpg|png)$}i
end

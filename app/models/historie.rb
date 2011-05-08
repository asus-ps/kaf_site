class Historie < ActiveRecord::Base
  validates_presence_of :body
  validates_length_of :image, :maximum => 255
  validates_format_of :image, :allow_blank => true, :with =>%r{\.(gif|jpg|png)$}i
end

class Contact < ActiveRecord::Base
  validates_presence_of :address
  validates_presence_of :phones
  validates_length_of :address, :maximum => 255
  validates_length_of :phones, :maximum => 255
  validates_length_of :email, :maximum => 255
  validates_length_of :url, :maximum => 255
  validates_length_of :image, :maximum => 255
  validates_format_of :email, :allow_blank => true, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_format_of :image, :allow_blank => true, :with =>%r{\.(gif|jpg|png)$}i
end

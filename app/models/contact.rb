class Contact < ActiveRecord::Base
  validates_presence_of :address
  validates_presence_of :phones
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_format_of :image, :with =>%r{\.(gif|jpg|png)$}i


end

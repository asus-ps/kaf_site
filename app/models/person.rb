class Person < ActiveRecord::Base
  has_one :student, :foreign_key => 'person_id', :dependent => :destroy
  has_one :teacher, :foreign_key => 'person_id', :dependent => :destroy
  validates_presence_of :last_name
  validates_presence_of :first_name
  validates_presence_of :patronymic_name
  validates_presence_of :birthday
  validates_presence_of :nature
  validates_length_of :last_name, :maximum => 63
  validates_length_of :first_name, :maximum => 63
  validates_length_of :patronymic_name, :maximum => 63
  validates_length_of :phone, :maximum => 63
  validates_length_of :email, :maximum => 255
  validates_length_of :photo, :maximum => 255

  validates_format_of :email, :allow_blank => true, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_format_of :photo, :allow_blank => true, :with =>%r{\.(gif|jpg|png)$}i
end

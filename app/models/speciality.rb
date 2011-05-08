class Speciality < ActiveRecord::Base
  has_many :students
  validates_presence_of :code
  validates_presence_of :name
  validates_presence_of :count_years
  validates_length_of :code, :maximum => 63
  validates_length_of :name, :maximum => 127
  validates_length_of :in_diploma, :maximum => 127
  validates_length_of :short_name, :maximum => 63
end

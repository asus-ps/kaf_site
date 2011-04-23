class Speciality < ActiveRecord::Base
  has_many :students
  #validates_presence_of :code, :name, :count_years
end

class Student < ActiveRecord::Base
  set_primary_key('person_id')
  belongs_to :person, :foreign_key => 'person_id', :dependent => :destroy
  belongs_to :speciality, :foreign_key => 'speciality_id'
  accepts_nested_attributes_for :person
  has_many :diplomas, :foreign_key => 'student_id'
  validates_presence_of :year_income
end

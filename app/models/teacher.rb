class Teacher < ActiveRecord::Base
  set_primary_key('person_id')
  belongs_to :person, :foreign_key => 'person_id', :dependent => :destroy
  belongs_to :degree, :foreign_key => 'degree_id'
  belongs_to :position, :foreign_key => 'position_id'
  has_many :disciplines_teachers, :foreign_key => 'teacher_id'
  has_many :diplomas, :foreign_key => 'teacher_id'
  accepts_nested_attributes_for :person
end

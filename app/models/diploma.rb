class Diploma < ActiveRecord::Base
  belongs_to :student, :foreign_key => 'student_id'
  belongs_to :teacher, :foreign_key => 'teacher_id'
  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :teacher
  validates_presence_of :name, :message => 'У диплома должна быть тема'
  validates_length_of :name, :maximum => 254 , :message => 'Слишком длинная тема диплома'
end

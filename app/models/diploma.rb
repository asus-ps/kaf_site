class Diploma < ActiveRecord::Base
  belongs_to :student, :foreign_key => 'student_id'
  belongs_to :teacher, :foreign_key => 'teacher_id'
end

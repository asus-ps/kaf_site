class DisciplinesTeacher < ActiveRecord::Base
  belongs_to :teacher, :foreign_key => 'teacher_id'
  belongs_to :discipline, :foreign_key => 'discipline_id'
  validates_presence_of :teacher_id, :message => 'Необходимо указать преподавателя'
  validates_presence_of :discipline_id, :message => 'Необходимо указать дисциплину'
end

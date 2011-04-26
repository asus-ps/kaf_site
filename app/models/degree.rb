class Degree < ActiveRecord::Base
  has_many :teachers, :foreign_key => 'degree_id'
  validates_presence_of :name, :message => 'Необходимо ввести название учёной степени'
  validates_length_of :name, :maximum => 254 , :message => 'Слишком длинное название учёной степени'
end

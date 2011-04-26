class Discipline < ActiveRecord::Base
  has_many :disciplines_teachers, :foreign_key => 'discipline_id'
  validates_presence_of :name, :message => 'Необходимо ввести название дисциплины'
  validates_length_of :name, :maximum => 127 ,:message => 'Слишком длинное название дисциплины'
end

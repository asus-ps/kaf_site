class Discipline < ActiveRecord::Base
  has_many :disciplines_teachers, :foreign_key => 'discipline_id' 
  validates_presence_of :name
  validates_length_of :name, :maximum => 127
end

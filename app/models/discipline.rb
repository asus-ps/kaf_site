class Discipline < ActiveRecord::Base
  has_many :disciplines_teachers, :foreign_key => 'discipline_id'
end

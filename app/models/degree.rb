class Degree < ActiveRecord::Base
  has_many :teachers, :foreign_key => 'degree_id'
end

class Degree < ActiveRecord::Base
  has_many :teachers, :foreign_key => 'degree_id'
  validates_presence_of :name
  validates_length_of :name, :maximum => 127
  validates_length_of :short_name, :maximum => 63
end

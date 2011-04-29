class Position < ActiveRecord::Base
  has_many :teachers, :foreign_key => 'position_id'
  validates_presence_of :name
end

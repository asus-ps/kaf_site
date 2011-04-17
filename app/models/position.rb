class Position < ActiveRecord::Base
  has_many :teachers, :foreign_key => 'position_id'
end

class Position < ActiveRecord::Base
  has_many :teachers, :foreign_key => 'position_id'
  validates_presence_of :name, :message => 'Введите название должности'
  #validates_presence_of :short_name, :message => 'Введите название должности'
end

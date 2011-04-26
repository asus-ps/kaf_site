class Speciality < ActiveRecord::Base
  has_many :students
  #validates_presence_of :code, :name, :count_years
  validates_presence_of :code, :message => 'Необходимо указать код специальности'
  validates_presence_of :name, :message => 'Необходимо указать название специальности'
  validates_presence_of :count_years, :message => 'Необходимо указать количество лет обучения'
  validates_length_of :code, :maximum => 63 ,:message => 'Слишком длинный код специальности'
  validates_length_of :name, :maximum => 127 ,:message => 'Слишком длинное название специальности'

end

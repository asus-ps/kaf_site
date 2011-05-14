class Student < ActiveRecord::Base
  set_primary_key('person_id')
  belongs_to :person, :foreign_key => 'person_id', :dependent => :destroy
  belongs_to :speciality, :foreign_key => 'speciality_id'
  has_many :diplomas, :foreign_key => 'student_id'
  accepts_nested_attributes_for :person
  validates_presence_of :year_income

  def self.search(search)
    if search
      find(:all,:include => :person, :include => :speciality, :conditions => ['first_name LIKE :q OR last_name LIKE :q OR patronimyc_name LIKE :q OR phone LIKE :q OR email LIKE :q ',{:q => "%#{search}%"}])
    else
      find(:all,:include => :person, :include => :speciality)
    end
  end
end

class Student < ActiveRecord::Base
  set_primary_key('person_id')
  belongs_to :person, :foreign_key => 'person_id', :dependent => :destroy
  belongs_to :speciality, :foreign_key => 'speciality_id'
  has_many :diplomas, :foreign_key => 'student_id'
  accepts_nested_attributes_for :person
  validates_presence_of :year_income

  def self.search(search,page)
    if search
      paginate :per_page => 25, :page => page,
               :include => [:person, :speciality],
               :conditions => ['people.first_name LIKE :q OR people.last_name LIKE :q OR people.patronymic_name LIKE :q OR people.phone LIKE :q OR people.email LIKE :q OR specialities.name LIKE :q OR year_income=:t',{:q => "%#{search}%",:t => "#{search}"}],
               :order => 'people.last_name'
    else
      paginate :per_page => 25, :page => page,
               :include => [:person, :speciality], 
               :order => 'people.last_name'
    end
  end
end

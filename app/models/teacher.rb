class Teacher < ActiveRecord::Base
  set_primary_key('person_id')
  belongs_to :person, :foreign_key => 'person_id', :dependent => :destroy
  belongs_to :degree, :foreign_key => 'degree_id'
  belongs_to :position, :foreign_key => 'position_id'
  has_many :disciplines_teachers, :foreign_key => 'teacher_id'
  has_many :diplomas, :foreign_key => 'teacher_id'
  accepts_nested_attributes_for :person

  def self.search(search,page)
    if search
      paginate :per_page => 25, :page => page,
               :include => [:person, :degree, :position],
               :conditions => ['people.first_name LIKE :q OR people.last_name LIKE :q OR people.patronymic_name LIKE :q OR people.phone LIKE :q OR people.email LIKE :q OR degrees.name LIKE :q OR positions.name LIKE :q ',{:q => "%#{search}%"}],
               :order => 'people.last_name'
    else
      paginate :per_page => 25, :page => page,
               :include => [:person, :degree, :position],
               :order => 'people.last_name'
    end
  end

end

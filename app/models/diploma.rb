class Diploma < ActiveRecord::Base

  belongs_to :student, :foreign_key => 'student_id', :include => :person
  belongs_to :teacher, :foreign_key => 'teacher_id', :include => :person

  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :teacher

  validates_presence_of :name
  validates_presence_of :protection_year
  validates_length_of :name, :maximum => 255
  validates_uniqueness_of :name, :scope => [:student_id,:teacher_id,:protection_year]

  def self.search(search,page)
    if search
      Diploma.all(:include =>  [{:student => :person}, {:teacher => :person}] ,
               :conditions => ['people.last_name LIKE :q OR diplomas.name LIKE :q OR people_teachers.last_name like :q OR protection_year=:t',{:q => "%#{search}%",:t => "#{search}"}],:order => 'name').paginate(
                          :per_page => 25, :page => page)
    else
      Diploma.all(:include =>  [ {:student => :person},{:teacher => :person}], :order => 'name').paginate(:per_page => 25, :page => page)
    end
  end
end

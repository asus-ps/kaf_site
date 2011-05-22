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
#      paginate :per_page => 20, :page => page,
#               #:joins => ['LEFT OUTER JOIN `teachers` ON `teachers`.person_id = `diplomas`.teacher_id LEFT OUTER JOIN `people` ON `people`.id = `teachers`.person_id ','LEFT OUTER JOIN `students` ON `students`.person_id = `diplomas`.student_id LEFT OUTER JOIN `people` ON `people`.id = `students`.person_id '],
#              # :include =>  [{ :student => :person } ],
#               #:joins => 'LEFT OUTER JOIN `teachers` ON `teachers`.person_id = `diplomas`.teacher_id LEFT OUTER JOIN `people` ON `people`.id = `teachers`.person_id ','LEFT OUTER JOIN `students` ON `students`.person_id = `diplomas`.student_id LEFT OUTER JOIN `people` ON `people`.id = `students`.person_id '],
#               :include =>  { :student => :person }+{ :teacher => :person },
#               :conditions => ['people.last_name LIKE :q OR name LIKE :q OR protection_year=:t ',{:q => "%#{search}%",:t => "#{search}"}],
#               #:include =>  [{ :teacher => :person } ],
#               #:conditions => ['people.last_name LIKE :q OR name LIKE :q OR protection_year=:t ',{:q => "%#{search}%",:t => "#{search}"}],
#               :order => 'name'
#      @t = Diploma.all(:include => { :student => :person }, :conditions => ['people.last_name LIKE :q OR name LIKE :q OR protection_year=:t ',{:q => "%#{search}%",:t => "#{search}"}])
#      @s = Diploma.all(:include => { :teacher => :person }, :conditions => ['people.last_name LIKE :q OR name LIKE :q OR protection_year=:t ',{:q => "%#{search}%",:t => "#{search}"}])
#      @all = @t + @s

Diploma.all(:include =>  [{:student => :person}, {:teacher => :person}] ,
               :conditions => ['people.last_name LIKE :q OR diplomas.name LIKE :q OR people_teachers.last_name like :q OR protection_year=:t',{:q => "%#{search}%",:t => "#{search}"}]).paginate(
                          :per_page => 20, :page => page,
                          :order => 'name')
    else
      paginate :per_page => 20, :page => page,
               :include =>  [ {:student => :person},{:teacher => :person}] ,
               :order => 'name'
    end
  end
end

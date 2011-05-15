class Diploma < ActiveRecord::Base
  belongs_to :student, :foreign_key => 'student_id'
  belongs_to :teacher, :foreign_key => 'teacher_id'
  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :teacher
  validates_presence_of :name
  validates_presence_of :protection_year
  validates_length_of :name, :maximum => 255
  validates_uniqueness_of :name, :scope => [:student_id,:teacher_id,:protection_year]

  def self.search(search,page)
    if search
      paginate :per_page => 20, :page => page,
               :include =>  [{:teacher => :person}, {:student => :person}] ,
               :conditions => ['people.last_name LIKE :q OR name LIKE :q OR protection_year=:t ',{:q => "%#{search}%",:t => "#{search}"}],
               :order => 'name'
    else
      paginate :per_page => 20, :page => page,
               :include =>  [{:teacher => :person}, {:student => :person}] ,
               :order => 'name'
    end
  end
end

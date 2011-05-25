class DisciplinesTeacher < ActiveRecord::Base
  belongs_to :teacher, :foreign_key => 'teacher_id'
  belongs_to :discipline, :foreign_key => 'discipline_id'
  validates_presence_of :teacher_id
  validates_presence_of :discipline_id
  validates_uniqueness_of :teacher_id, :scope => [:discipline_id]

  def self.search(search,page)
    if search
      DisciplinesTeacher.all(:include =>  [{:teacher => :person}, :discipline] ,
               :conditions => ['people.last_name LIKE :q OR disciplines.name LIKE :q  ',{:q => "%#{search}%"}]).paginate(:per_page => 20, :page => page,
               :order => 'disciplines.name')
    else
      DisciplinesTeacher.all(:include =>  [{:teacher => :person}, :discipline]).paginate(:per_page => 20, :page => page,
               :order => 'disciplines.name')
    end
  end
end

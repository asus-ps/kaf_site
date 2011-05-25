class DisciplinesTeacher < ActiveRecord::Base

  belongs_to :teacher, :foreign_key => 'teacher_id'
  belongs_to :discipline, :foreign_key => 'discipline_id'

  validates_presence_of :teacher_id
  validates_presence_of :discipline_id
  validates_uniqueness_of :teacher_id, :scope => [:discipline_id]

  def self.search(search,page)
    if search
      DisciplinesTeacher.all(:include =>  [{:teacher => :person}, :discipline] ,
               :conditions => ['people.last_name LIKE :q OR disciplines.name LIKE :q  ',{:q => "%#{search}%"}],:order => 'disciplines.name').paginate(:per_page => 20, :page => page)
    else
      DisciplinesTeacher.all(:include =>  [{:teacher => :person}, :discipline], :order => 'disciplines.name').paginate(:per_page => 20, :page => page)
    end
  end
end

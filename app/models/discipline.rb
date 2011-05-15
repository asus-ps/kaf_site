class Discipline < ActiveRecord::Base
  has_many :disciplines_teachers, :foreign_key => 'discipline_id' 
  validates_presence_of :name
  validates_length_of :name, :maximum => 127
  validates_uniqueness_of :name

  def self.search(search,page)
    if search
      paginate :per_page => 20, :page => page,
               :conditions => ['name LIKE ?', "%#{search}%"],
               :order => 'name'
    else
      paginate :per_page => 20, :page => page,
               :order => 'name'
    end
  end
end

class Discipline < ActiveRecord::Base
  has_many :disciplines_teachers, :foreign_key => 'discipline_id' 
  validates_presence_of :name
  validates_length_of :name, :maximum => 127
  validates_uniqueness_of :name

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end

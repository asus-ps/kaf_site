class Degree < ActiveRecord::Base
  has_many :teachers, :foreign_key => 'degree_id'
  validates_presence_of :name
  validates_length_of :name, :maximum => 127
  validates_length_of :short_name, :maximum => 63
  validates_uniqueness_of :name

  def self.search(search,page)
    if search
      paginate :per_page => 5, :page => page,
               :conditions => ['name LIKE :q OR short_name LIKE :q ',{:q => "%#{search}%"}],
               :order => 'name'
    else
      paginate :per_page => 5, :page => page,
               :order => 'name'      
    end
  end
end

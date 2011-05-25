class Position < ActiveRecord::Base
  has_many :teachers, :foreign_key => 'position_id'

  validates_presence_of :name
  validates_length_of :name, :maximum => 127
  validates_length_of :short_name, :maximum => 63

  def self.search(search,page)
    if search
      Position.all(:conditions => ['name LIKE :q OR short_name LIKE :q ',{:q => "%#{search}%"}], :order => 'name').paginate(
               :per_page => 20, :page => page)
    else
      Position.all(:order => 'name').paginate(:per_page => 20, :page => page)
               
    end
  end
end

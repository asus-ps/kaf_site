class Article < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title  
  validates_presence_of :body
  validates_length_of :title, :maximum => 255
  validates_length_of :image, :maximum => 255
  validates_format_of :image, :allow_blank => true, :with =>%r{\.(gif|jpg|png)$}i
  validates_uniqueness_of :body, :scope => [:title]

  def self.search(search,page)
    if search
      paginate  :per_page => 20, :page => page,
                :conditions => ['title LIKE :q OR body LIKE :q OR priority=:t',{:q => "%#{search}%",:t => "#{search}"}],
                :order => :created_at
    else
      paginate  :per_page => 20, :page => page,
                :order => :created_at
    end
  end
end

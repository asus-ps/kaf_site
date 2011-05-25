class Article < ActiveRecord::Base
  has_many :comments

  before_save :prepare_picture_fields
  after_save :save_picture

  validates_presence_of :title, :body
  validates_length_of :title, :maximum => 255
  validates_uniqueness_of :body, :scope => [:title]

  attr_accessor :picture

  def self.search(search,page)
    if search
      Article.all(:conditions => ['title LIKE :q OR body LIKE :q OR priority=:t',{:q => "%#{search}%",:t => "#{search}"}]).paginate( :per_page => 20, :page => page,
                  :order => :created_at)
    else
      Article.all.paginate(:per_page => 20, :page => page,
                  :order => :created_at)
    end
  end

  public
  def picture_path
    File.join('/', self.class.name.pluralize.mb_chars.downcase, "#{self.id}.#{self.picture_ext}")
  end

  def picture_exists?
    !self.picture_ext.blank?
  end

private
  def prepare_picture_fields
    self.picture_ext = @picture.original_filename.split('.').last.mb_chars.downcase
    self.picture_name = @picture.original_filename.mb_chars.downcase
  end

  def save_picture
    path = File.join(RAILS_ROOT, 'public', self.class.name.pluralize.mb_chars.downcase, "#{self.id}.#{self.picture_ext}")
    File.open(path, "wb") do  |f|
      f.write(@picture.read)
    end
  end
end

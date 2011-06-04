class Article < ActiveRecord::Base
  has_many :comments

  validates_presence_of :title, :body
  validates_length_of :title, :maximum => 255
  validates_uniqueness_of :body, :scope => [:title]


  before_save :prepare_picture_fields
  after_save :save_picture

  attr_accessor :picture

  def self.search(search,page)
    if search
      Article.all(:conditions => ['title LIKE :q OR body LIKE :q OR priority=:t',{:q => "%#{search}%",:t => "#{search}"}],:order => :created_at).paginate( :per_page => 20, :page => page)
    else
      Article.all(:order => :created_at).paginate(:per_page => 20, :page => page)
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
    if @picture
      self.picture_ext = @picture.original_filename.split('.').last.mb_chars.downcase
      self.picture_name = @picture.original_filename.mb_chars.downcase
    else
    #  self.picture_ext = ''
    #  self.picture_name = ''
    end
  end

  def save_picture
    if @picture
      path = File.join(RAILS_ROOT, 'public', self.class.name.pluralize.mb_chars.downcase, "#{self.id}.#{self.picture_ext}")
      File.open(path, "wb") do  |f|
        f.write(@picture.read)
      end
    end
  end
end

class Historie < ActiveRecord::Base
  
  before_save :prepare_picture_fields
  after_save :save_picture

  validates_presence_of :body
  #validates_length_of :image, :maximum => 255
  #validates_format_of :image, :allow_blank => true, :with =>%r{\.(gif|jpg|png)$}i



  attr_accessor :picture
  #named_scope :histories, :conditions => ()

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

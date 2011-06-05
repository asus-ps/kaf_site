class Person < ActiveRecord::Base

  has_one :student, :foreign_key => 'person_id', :dependent => :destroy
  has_one :teacher, :foreign_key => 'person_id', :dependent => :destroy

    validates_presence_of :last_name, :first_name, :patronymic_name, :birthday, :nature
  
  validates_length_of :last_name, :maximum => 63
  validates_length_of :first_name, :maximum => 63
  validates_length_of :patronymic_name, :maximum => 63
  validates_length_of :phone, :maximum => 63
  validates_length_of :email, :maximum => 255
  #validates_length_of :photo, :maximum => 255
  validates_format_of :email, :allow_blank => true, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  #validates_format_of :photo, :allow_blank => true, :with =>%r{\.(gif|jpg|png)$}i
  validates_uniqueness_of :last_name, :scope => [:first_name,:patronymic_name,:birthday,:nature]

  before_save :prepare_picture_fields
  after_save :save_picture

  attr_accessor :picture, :del

  named_scope :teachers, :conditions => ()
  named_scope :students, :conditions => ()

  def self.search(search)
    if search
      find(:all, :conditions => ['first_name LIKE :q OR last_name LIKE :q OR patronimyc_name LIKE :q OR phone LIKE :q OR email LIKE :q ',{:q => "%#{search}%"}])
    else
      find(:all)
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
    if @picture  && !@picture.eof?
      self.picture_ext = @picture.original_filename.split('.').last.mb_chars.downcase
      self.picture_name = @picture.original_filename.mb_chars.downcase
    else
      if @del
        self.picture_ext = nil
        self.picture_name = nil
      end
    end
  end

  def save_picture    
    if @picture && !@picture.eof?
      # create the file path
      path = File.join(RAILS_ROOT, 'public', self.class.name.pluralize.mb_chars.downcase, "#{self.id}.#{self.picture_ext}")
      # write the file
      File.open(path, "wb") do  |f|
        f.write(@picture.read)
      end
    end
  end

end

class Historie < ActiveRecord::Base
  validates_presence_of :body
  validates_length_of :image, :maximum => 255
  validates_format_of :image, :allow_blank => true, :with =>%r{\.(gif|jpg|png)$}i

  def self.uploadfile(upload)
    name =  upload['datafile'].
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end

end

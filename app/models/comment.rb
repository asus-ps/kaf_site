class Comment < ActiveRecord::Base
  belongs_to :article
  
  validates_presence_of :body, :author_name, :author_email 
  validates_length_of :author_name, :maximum => 63
  validates_length_of :author_email, :maximum => 63
  validates_format_of :author_email, :allow_blank => false, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
end

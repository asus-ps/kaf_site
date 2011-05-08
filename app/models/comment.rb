class Comment < ActiveRecord::Base
  belongs_to :article
  validates_presence_of :body
  validates_presence_of :author_name
  validates_presence_of :author_email
  validates_presence_of :created_at
  validates_length_of :author_name, :maximum => 63
  validates_length_of :author_email, :maximum => 63
  validates_format_of :email, :allow_blank => true, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
end

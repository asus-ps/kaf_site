class Comment < ActiveRecord::Base
  belongs_to :article
  #validates_presence_of :author_name, :author_email, :body, :created_at
end

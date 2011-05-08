class Link < ActiveRecord::Base
  validates_presence_of :url
  validates_length_of :url, :maximum => 255
end

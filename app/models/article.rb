class Article < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title, :message => 'У новости должен быть заголовок'
  validates_length_of :title, :maximum => 255
  validates_presence_of :body, :message => 'У новости должна быть информативная часть'
  
end

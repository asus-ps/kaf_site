class Link < ActiveRecord::Base
  validates_presence_of :url, :message => "Не указана ссылка"
  validates_presence_of :url, :message => 'Необходимо указать ссылку на ресурс'
  validates_length_of :url, :maximum => 255 ,:message => 'Слишком длинная ссылка на ресурс'
end

class Link < ActiveRecord::Base
  validates_presence_of :url, :message => "Не указана ссылка"
end

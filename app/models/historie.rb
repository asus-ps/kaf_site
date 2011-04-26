class Historie < ActiveRecord::Base
  validates_presence_of :body, :message => 'Необходимо заполнить поле "История"'

end

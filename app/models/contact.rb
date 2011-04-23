class Contact < ActiveRecord::Base
  validates_presence_of :address, :message => 'Укажите адрес'
  validates_presence_of :phones, :message => 'Укажите телефоны'
  #validates_length_of :email, {:minimum => 3, :maximum => 254}, :message => 'Недопустимый размер e-mail'
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i , :message => "Ошибка в e-mail"
  validates_format_of :image, :with =>%r{\.(gif|jpg|png)$}i, :message => 'Изображение должно быть в формате GIF, JPG или PNG'


end

class Student < ActiveRecord::Base
  set_primary_key('person_id')
  belongs_to :person, :foreign_key => 'person_id', :dependent => :destroy
end

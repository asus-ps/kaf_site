class CreateDisciplinesTeachers < ActiveRecord::Migration
  def self.up
    create_table :disciplines_teachers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :disciplines_teachers
  end
end

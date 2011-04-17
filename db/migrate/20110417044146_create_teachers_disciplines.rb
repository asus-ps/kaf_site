class CreateTeachersDisciplines < ActiveRecord::Migration
  def self.up
    create_table :teachers_disciplines do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :teachers_disciplines
  end
end

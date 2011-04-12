class CreateSpecialitys < ActiveRecord::Migration
  def self.up
    create_table :specialities do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :specialities
  end
end

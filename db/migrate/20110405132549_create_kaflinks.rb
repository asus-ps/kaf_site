class CreateKaflinks < ActiveRecord::Migration
  def self.up
    create_table :kaflinks do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :kaflinks
  end
end

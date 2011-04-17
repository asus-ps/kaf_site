class CreateDiplomas < ActiveRecord::Migration
  def self.up
    create_table :diplomas do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :diplomas
  end
end

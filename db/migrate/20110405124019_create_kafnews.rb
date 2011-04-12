class CreateKafnews < ActiveRecord::Migration
  def self.up
    create_table :kafnews do |t|
      t.string :title_new
      t.text :text_new
      t.int :prioritet
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :kafnews
  end
end

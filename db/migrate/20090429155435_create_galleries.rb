class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.references :org
      t.string :title
      t.text :content
      t.integer :position, :null => false, :default => 1
      t.integer :photos_count, :null => false, :default => 0
      t.boolean :delta
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end

class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.references :gallery, :null => false
      t.integer :position, :null => false, :default => 1
      t.string :title, :limit => 128
      t.string :image_file_name 
      t.string :image_content_type 
      t.integer :image_file_size 
      t.datetime :image_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end

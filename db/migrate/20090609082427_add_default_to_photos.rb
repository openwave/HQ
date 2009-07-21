class AddDefaultToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :default, :boolean, :default => false
    
  end
  
  def self.down
    remove_column :photos, :default
 
    
  end
end
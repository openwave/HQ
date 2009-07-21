class AddDefaultToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :default, :boolean, :default => false
    
  end
  
  def self.down
    remove_column :galleries, :default
 
    
  end
end
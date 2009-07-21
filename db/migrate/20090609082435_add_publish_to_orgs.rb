class AddPublishToOrgs < ActiveRecord::Migration
  def self.up
    add_column :orgs, :publish, :boolean, :default => false
    
  end
  
  def self.down
    remove_column :orgs, :publish
 
    
  end
end
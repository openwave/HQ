class AddColumn < ActiveRecord::Migration
  
  def self.up
     add_column :orgs, :contact_24, :boolean, :default => 0
  end

  def self.down
    remove_column :orgs,:contact_24
  end
end

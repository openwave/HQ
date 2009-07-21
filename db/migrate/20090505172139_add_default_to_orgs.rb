class AddDefaultToOrgs < ActiveRecord::Migration
  def self.up
    add_column :orgs, :logo, :boolean, :default => false
    add_column :orgs, :image_file_name, :string
    add_column :orgs, :image_content_type, :string
    add_column :orgs, :image_file_size, :string
    add_column :orgs, :video_count, :integer, :default => 0
  end
  
  def self.down
    remove_column :orgs, :logo
    remove_column :orgs, :image_file_name
    remove_column :orgs, :image_content_type
    remove_column :orgs, :image_file_size
    remove_column :orgs, :video_count
    
  end
end
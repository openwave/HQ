class AddOrgIdToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :org_id, :integer
   
  end

  def self.down
    remove_column :videos, :org_id
  
  end
end
class OrgTabCount < ActiveRecord::Migration
  def self.up
    add_column :orgs,:tab_count,:integer,:default => 0
  end

  def self.down
    remove_column :orgs,:tab_count
  end
end

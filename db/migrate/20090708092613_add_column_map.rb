class AddColumnMap < ActiveRecord::Migration
  def self.up
    add_column :orgs, :map_it, :boolean, :default => 0
  end

  def self.down
  end
end

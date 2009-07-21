class AddDefaultToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :default, :boolean, :default => false

  end

  def self.down
    remove_column :videos, :default


  end
end
class AddApproveToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :approve, :boolean

  end

  def self.down
    remove_column :videos, :approve

  end
end

class AddColumnRank < ActiveRecord::Migration
  def self.up
    add_column :events,:rank,:integer
  end

  def self.down
  end
end

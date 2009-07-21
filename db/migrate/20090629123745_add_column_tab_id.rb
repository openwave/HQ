class AddColumnTabId < ActiveRecord::Migration
  def self.up
    add_column :prices, :tab_id, :integer
  end

  def self.down
  end
end

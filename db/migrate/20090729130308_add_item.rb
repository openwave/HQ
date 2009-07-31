class AddItem < ActiveRecord::Migration
  def self.up
     add_column :prices, :item, :string
  end

  def self.down
    remove_column :prices, :item
  end
end

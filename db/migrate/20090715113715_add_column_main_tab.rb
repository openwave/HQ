class AddColumnMainTab < ActiveRecord::Migration
  def self.up
     add_column :price_tabs, :main_tab, :integer
   
  end

  def self.down
    remove_column :price_tabs,:main_tab
  end
end

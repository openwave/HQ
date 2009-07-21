class PriceTabs < ActiveRecord::Migration
  def self.up
   create_table :price_tabs do |t|   
    t.integer :org_id
    t.string :tab_name
  end
  end
  
  def self.down
    drop_table :price_tabs
  end
end

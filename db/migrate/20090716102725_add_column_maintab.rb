class AddColumnMaintab < ActiveRecord::Migration
  def self.up
   add_column :prices,:main_tab,:integer
  end

  def self.down
remove_column :prices,:main_tab
  end
end

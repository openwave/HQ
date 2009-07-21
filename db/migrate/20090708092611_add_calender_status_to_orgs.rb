class AddCalenderStatusToOrgs < ActiveRecord::Migration
  def self.up
    add_column :orgs, :calender_status, :boolean, :default => false
   
  end

  def self.down
    remove_column :orgs, :calender_status
  end
end
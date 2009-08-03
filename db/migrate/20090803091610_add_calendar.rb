class AddCalendar < ActiveRecord::Migration
  def self.up
    add_column :orgs,:calendar,:string
  end

  def self.down
    remove_column :orgs,:calendar
  end
end

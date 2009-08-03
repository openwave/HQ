class AddCalendar < ActiveRecord::Migration
  def self.up
    add_column :calendar,:orgs,:string
  end

  def self.down
    remove_column :calendar,:orgs
  end
end

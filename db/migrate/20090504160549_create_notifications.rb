class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :org_id
      t.boolean :promotion
      t.boolean :deal
      t.boolean :news
      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end

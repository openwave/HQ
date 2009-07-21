class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :org_id
      t.string :title
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end

class CreateTabs < ActiveRecord::Migration
  def self.up
    create_table :tabs do |t|
      t.references :org
      t.string :title
      t.text :content
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :tabs
  end
end
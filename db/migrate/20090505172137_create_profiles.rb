class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.references :org, :null => false
      t.text :content
      
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
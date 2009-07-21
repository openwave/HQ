class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.references :org
      t.string :deal_type
      t.string :deal_value
      t.string :title
      t.string :description
      t.integer :rank, :default => 0
      t.integer :position
      t.string :photo_file_name
      t.string :deals, :photo_content_type
      t.integer :deals, :photo_file_size
      t.datetime :deals, :photo_updated_at
      t.boolean :delta
      t.timestamps
    end
    create_table :disclaimers do |t|
      t.string :name
      t.timestamps
    end
    create_table :deal_disclaimers do |t|
      t.integer :deal_id
      t.integer :disclaimer_id
      t.timestamps
    end
  end

  def self.down
    drop_table :deals
    drop_table :disclaimers
    drop_table :deal_disclaimers
  end
end

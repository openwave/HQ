class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.references :org
      t.string :title
      t.string :description
      t.string :street
      t.string :locality
      t.string :region
      t.string :postal_code
      t.string :country
      t.datetime :starting_on
      t.datetime :ending_on
      t.string :image_file_name 
      t.string :image_content_type 
      t.integer :image_file_size 
      t.datetime :image_updated_at
      t.string :age_requirement, :default => "None"
      t.boolean :delta
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

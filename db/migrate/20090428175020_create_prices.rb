class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.references :org
      t.string :group
      t.string :title
      t.decimal :price
      t.text :description
      t.text :content
      t.string :photo_file_name
      t.string :photo_content_type, :string
      t.integer  :photo_file_size, :integer
      t.datetime :photo_updated_at, :datetime
      t.integer  :position
      t.boolean :delta
      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end

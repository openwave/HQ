class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.references :org
      t.string :name
      t.string :town
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
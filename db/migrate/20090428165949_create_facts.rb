class CreateFacts < ActiveRecord::Migration
  def self.up
    create_table :facts do |t|
      t.references :org
      t.string :title
      t.text :content
      t.boolean :delta
      t.timestamps
    end
  end

  def self.down
    drop_table :facts
  end
end

class CreateFlowings < ActiveRecord::Migration
  def self.up
    create_table :flowings do |t|
      t.references :org
      t.string :title
      t.text :content
      t.boolean :delta
      t.timestamps
    end
  end

  def self.down
    drop_table :flowings
  end
end

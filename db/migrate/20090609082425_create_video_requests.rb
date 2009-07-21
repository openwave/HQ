class CreateVideoRequests < ActiveRecord::Migration
  def self.up
    create_table :video_requests do |t|
      t.references :org
      t.text :content
      t.string :name
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :video_requests
  end
end
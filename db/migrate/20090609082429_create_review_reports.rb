class CreateReviewReports < ActiveRecord::Migration
  def self.up
    create_table :review_reports do |t|
      t.references :review
      t.integer :user_id
      t.text :content
      
      t.timestamps
    end
  end

  def self.down
    drop_table :review_reports
  end
end

class AddRankToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :rank, :integer, :default => 0
    
  end
  
  def self.down
    remove_column :reviews, :rank
 
    
  end
end
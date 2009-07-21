class AddVoteStatusToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :vote_status, :integer, :default => 0
   
  end

  def self.down
    remove_column :deals, :vote_status
  end
end
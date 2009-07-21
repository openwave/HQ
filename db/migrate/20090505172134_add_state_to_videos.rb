class AddStateToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :state, :string
   
  end

  def self.down
    remove_column :videos, :state
  
  end
end
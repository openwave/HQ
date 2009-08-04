class RankEvent < ActiveRecord::Migration

  def self.up
      remove_column :events,:rank
    add_column :events,:rank,:integer,:default=>0
  end

  def self.down
    add_column :events,:rank,:integer
   remove_column :events,:rank
  end

end

class AddColumnTabid < ActiveRecord::Migration
  def self.up
    add_column :highlights,:tabid,:integer
  end

  def self.down
  end
end

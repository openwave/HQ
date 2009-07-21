class AddRatingColumns < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.create_ratings_table
    Org.add_ratings_columns
  end

  def self.down
    Org.remove_ratings_columns
    ActiveRecord::Base.drop_ratings_table
  end
end
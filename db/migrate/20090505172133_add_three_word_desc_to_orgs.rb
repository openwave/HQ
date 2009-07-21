class AddThreeWordDescToOrgs < ActiveRecord::Migration
  def self.up
    add_column :orgs, :three_word_desc, :string
   
  end

  def self.down
    remove_column :orgs, :three_word_desc
  
  end
end
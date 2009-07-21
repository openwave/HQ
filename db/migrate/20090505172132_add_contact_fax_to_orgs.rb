class AddContactFaxToOrgs < ActiveRecord::Migration
  def self.up
    add_column :orgs, :contact_fax, :string
   
  end

  def self.down
    remove_column :orgs, :contact_fax
  
  end
end
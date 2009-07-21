class CreateOrgs < ActiveRecord::Migration
  def self.up
    create_table :orgs do |t|
      t.references :user
      t.string :title
      t.string :street
      t.string :locality
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :url
      t.string :hq_url
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_email
      t.string :contact_phone_work
      t.string :contact_phone_cell
      t.boolean :is_authorized
      t.boolean :delta
      t.timestamps
    end
  end

  def self.down
    drop_table :orgs
  end
end
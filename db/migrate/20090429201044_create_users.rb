class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|      
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :street_2
      t.string :locality
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :phone
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :login_count
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
      t.string :perishable_token, :string, :default => "", :null => false
      t.boolean :hq_staff, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
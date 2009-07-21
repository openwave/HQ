class User < ActiveRecord::Base
  acts_as_authentic :login_field => :email
  has_one :org
  has_many :notifications
  validates_presence_of  :first_name,:message =>"can't be blank"
   validates_presence_of :last_name,:message =>"can't be blank"
   validates_presence_of  :email ,:message =>"can't be blank"
   
  # validates_length_of   :firstName, :within => 3..40, :too_long => "First name should no longer than 40 character", :too_short => "First name should have  at least 3 character"
  # validates_length_of   :lastName, :within => 3..40, :too_long => "Last name should no longer than 40 character", :too_short => "Last name should have  at least 3 character"
   validates_format_of   :first_name,:with => /^([a-zA-Z])[-._a-zA-Z0-9]+$/, :on => :create,:message =>"is invalid"
   validates_format_of   :last_name, :with => /^([a-zA-Z])[-._a-zA-Z0-9]+$/, :on => :create,:message =>"is invalid"
   #validates_format_of   :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i ,:message =>"Email is invalid"
  #validates_uniqueness_of :email,:message => "already taken"
  def validate
    
  end
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end

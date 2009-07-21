# app/models/notifier.rb
class Notifier < ActionMailer::Base
  default_url_options[:host] = "localhost:3000"
  #default_url_options[:host] = "208.77.101.230:3000"
      
  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "Hometown Quarterly"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
end
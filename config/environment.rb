# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'
  config.gem 'RedCloth', :lib=>'redcloth', :version => '>=3.301', :source=>'http://code.whytheluckystiff.net' # compiled
  config.gem 'mislav-will_paginate', :version => '~> 2.3.8', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem "authlogic", :version=> '1.4.1'
  config.gem "geokit"
  
  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
end

Geocode.geocoder = Graticule.service(:yahoo).new '9FXo0k3V34HjwOY9qwbcaWpHkVB3VNewg3CTGybIJ1UtZGeq9OT7bSNgO84-'

ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true



#ActionMailer::Base.delivery_method = :smtp

#ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.perform_deliveries = true
#ActionMailer::Base.default_charset = "utf-8"
#ActionMailer::Base.smtp_settings = {
 # :address => "mail.gmx.com",
 # :port => 25,
  #:domain => "gmx.com",
  #:authentication => :login,
  #:user_name => "mailer.wts@gmx.com",
  #:password => "wetechservices"
#}

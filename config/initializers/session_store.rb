# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_community_session',
  :secret      => 'eb784eb493f2b1e3e4051dc6d3122149c314c266bf7f7c0795eb424f7ee323635cc4a64e7530cbb38104f39ac31161640c6698fd6fb610ba405026eed631a9a2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

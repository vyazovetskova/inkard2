# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_inkard2_session',
  :secret      => '1b4f01e1adea1d91d7bb7f96d4659730f0c62048bbd168871756b539d5a2bdadf069d2e5ed4f31d8f62c4fb1970914270e63a7cdad13d1e3288f7a6cb216ac1b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

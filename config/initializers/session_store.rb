# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_inkard2_session',
  :secret      => 'e33d6b2bb74a6c502f1e543d6b6281842baccf4acdd35a544026a2515cfb30c2d28448b7b00e0d5668f22fec9f2ed351bf11383e359dbd627e30e578629bd5f8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

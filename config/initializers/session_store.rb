# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_financeiro_session',
  :secret      => '4ee35a508e1163bc0d2b2b3496736ad7fc85ef20dc34fb1bd2d26a16e87630dd706577af690b6cda344a580e2ffbf48a8e2c7214425f2349439cae988ffd715b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

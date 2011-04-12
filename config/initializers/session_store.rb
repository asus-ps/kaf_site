# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kaf_test_session',
  :secret      => '1e862356699333b1d374afa130ec0cf0936aad16df1c1520269cb083d21b7513729c3d569356b4f635cccf21f5142e3c59f7d97b0d7924ad6d6a353bcf126cbe'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

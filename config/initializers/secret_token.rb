# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# HbNote::Application.config.secret_key_base = '6a449b451211f2ee084a81a261154c1fbb09b5ac53e64a83ff28d23b464f70e5c4186d1f6e187626891a22549b72098a68213881e5afeda64e80b5ec71db655d'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# use existing token
		File.read(token_file).chomp
	else
		#generate a new token and store it in the token file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

HbNote::Application.config.secret_key_base = secure_token
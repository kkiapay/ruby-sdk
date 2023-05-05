# # Create new kkiapay instance

require_relative '../src/kkiapay.rb'

sandbox = false
k = Kkiapay.new('public_key', 'private_key', 'secret', sandbox)
result = k.verify_transaction('transaction_id')
puts result


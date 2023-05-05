# KKIAPAY RUBY-SDK

## Installing

Using npm:

```bash
    $ gem install kkiapay
```

## Initialization

```rb

require "kkiapay"

sandbox = false
# setup your api key (https://www.kkiapay.me)
k = Kkiapay.new('your_public_key', 'your_private_key', 'your_secret_key', sandbox)
```

## Request to retrieve transactions

#### EXAMPLE

```rb
# Request to retrieve transactions
result = k.verify_transaction('transaction_id')
puts result
```

## Request to revert transaction

#### EXAMPLE

```rb
# Request to retrieve transactions
result = k.refund_transaction('transaction_id')
puts result
```

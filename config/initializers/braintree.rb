Braintree::Configuration.environment = ENV['BRAINTREE_ENV']         || :sandbox
Braintree::Configuration.merchant_id = ENV['BRAINTREE_MERCHANT']
Braintree::Configuration.public_key = ENV['BRAINTREE_PUBLIC_KEY']
Braintree::Configuration.private_key = ENV['BRAINTREE_PRIVATE_KEY']
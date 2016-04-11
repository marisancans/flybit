Rails.configuration.stripe = {
  :stripe_test_publishable_key => ENV['STRIPE_TEST_PUBLISHABLE_PUBLIC_KEY'],
  :stripe_secret_key      => ENV['STRIPE_TEST_API_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:stripe_secret_key]
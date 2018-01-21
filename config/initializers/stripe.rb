if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_gl9DK1xCteioEzlShdMmpPdV',
    secret_key: 'sk_test_1QiPXLZ4FuL5fZn52pKSBCb5'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
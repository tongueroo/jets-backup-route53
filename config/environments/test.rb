Jets.application.configure do
  config.cache_classes = false
  config.eager_load = ENV["CI"].present?
  config.cache_store = :null_store
  config.consider_all_requests_local = true
  config.server_timing = true
  config.jets_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_mailer.delivery_method = :test
  config.action_mailer.perform_caching = false
  # config.action_mailer.default_url_options = { host: 'localhost', port: 8888 }
  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  # Docs: http://rubyonjets.com/docs/email-sending/
  config.action_mailer.delivery_method = :test
end

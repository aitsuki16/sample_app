# config/environments/production.rb

require "active_support/core_ext/integer/time"

Rails.application.configure do


  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Ensure that a master key has been made available.
  # config.require_master_key = true

  # Disable serving static files from the `/public` folder by default.
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Set log level to info.
  config.log_level = :info
#aws
  config.active_storage.service = :amazon
  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment).
  # config.active_job.queue_adapter = :resque
  # config.active_job.queue_name_prefix = "sample_app_production"

  config.action_mailer.perform_caching = false

  # Email settings for SendGrid on Render
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  host = 'sample-app-3bqx.onrender.com' # Your Render app URL
  config.action_mailer.default_url_options = { host: host, protocol: 'https' }
  config.action_mailer.default_options = { from: 'aidaiga16@gmail.com' } # Your verified sender email

  # SMTP settings for SendGrid
  config.action_mailer.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: 587,
    domain: 'sample-app-3bqx.onrender.com', # Your Render app domain
    authentication: :plain,
    user_name: 'apikey', # This should literally be 'apikey'
    password: ENV['SENDGRID_API_KEY'], # Environment variable for SendGrid API key
    enable_starttls_auto: true
  }

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Log to STDOUT if specified.
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
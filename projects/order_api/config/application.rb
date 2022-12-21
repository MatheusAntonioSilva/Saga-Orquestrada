require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OrderApi
  class Application < Rails::Application

    DEFAULT_LOCALE = :'pt-BR'

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.api_only = true
    config.session_store :cookie_store, key: '_interslice_session'
    # Required for all session management (regardless of session_store)
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options

    config.app = OpenStruct.new
    config.app.databases = OpenStruct.new
    config.app.databases.default = OpenStruct.new

    config.app.sidekiq = OpenStruct.new
    config.app.sidekiq.redis = OpenStruct.new

    config.app.payment_api = OpenStruct.new
    config.app.receivable_api = OpenStruct.new
    config.app.account_api = OpenStruct.new

    config.i18n.locale = DEFAULT_LOCALE
    config.i18n.default_locale = DEFAULT_LOCALE
    config.i18n.load_path += Dir[File.join(Rails.root, 'config', 'locales', '**', '*.{rb,yml}')]

    config.eager_load_paths << Rails.root.join('lib')
  end
end

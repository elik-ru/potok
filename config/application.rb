require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Potok
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.colorize_logging = false
    I18n.enforce_available_locales = true
    I18n.available_locales = [:en, :ru]

    config.i18n.default_locale = :ru # set default locale to Russian
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.time_zone = 'Moscow'  
    
  end
end

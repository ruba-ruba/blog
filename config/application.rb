require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Blog
  class Application < Rails::Application

    # CKEditor 
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    #locale
    #config.i18n.locale = :ua

    # don't generate RSpec tests for views and helpers
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.view_specs false
      g.helper_specs false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir["#{Rails.root.to_s}/config/locales/**/*.{rb,yml}"]
    config.i18n.default_locale = :ua


    config.assets.initialize_on_precompile=false
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.quiet_assets = true


    #let cofig devise
    config.to_prepare do
      Devise::SessionsController.layout "devise"
      # Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application"   : "devise" }
      # Devise::ConfirmationsController.layout "devise"
      # Devise::UnlocksController.layout "devise"            
      # Devise::PasswordsController.layout "devise"        
    end
  end
end

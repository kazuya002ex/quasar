require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module NovelApp
  class Application < Rails::Application

    # config.load_defaults 6.1
    config.load_defaults 5.2
    config.i18n.default_locale = :ja

    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone = :local

    config.assets.initialize_on_precompile = false

    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end
  end
end

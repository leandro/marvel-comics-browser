require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module MarvelComicsBrowser
  class Application < Rails::Application
    config.load_defaults 6.1

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end

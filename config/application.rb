require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nagoyameshi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # バリデーションエラーが発生したときに'field_with_errors'というclassを付加しない
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }

    # 日本語化
    config.i18n.available_locales = %i[ja en]
    config.i18n.default_locale = :ja

    # 複数のロケールファイルが読み込まれるようpathを通す
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    #タイムゾーン設定
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local
  end
end

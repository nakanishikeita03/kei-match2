# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'support/capybara.rb'
require 'simplecov'

SimpleCov.start 'rails'

Dir[Rails.root.join("spec/support/*.rb")].each { |f| require f }
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Warden::Test::Helpers
  config.include Rails.application.routes.url_helpers

  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!

  config.example_status_persistence_file_path = "spec/examples.txt"
  config.profile_examples = 3
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include Capybara::DSL

  config.before(:each) do |example|
    if example.metadata[:type] == :system
      if example.metadata[:js]
        driven_by :selenium_chrome_headless, screen_size: [1400, 1400]
        # see https://qiita.com/jnchito/items/c7e6e7abf83598a6516d#js-true%E3%81%AE%E3%81%A8%E3%81%8D%E3%81%A0%E3%81%91chrome%E3%82%92%E8%B5%B7%E5%8B%95%E3%81%99%E3%82%8B
      else
        driven_by :rack_test
      end
    end
  end

  config.after :each do
    Warden.test_reset!
  end



end

OmniAuth.config.test_mode = true
# SeedFu.quiet = true

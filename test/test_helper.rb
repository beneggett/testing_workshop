require 'simplecov'
require 'coveralls'
# require "codeclimate-test-reporter"

SimpleCov.formatters = [
  Coveralls::SimpleCov::Formatter,
  SimpleCov::Formatter::HTMLFormatter,
  # CodeClimate::TestReporter::Formatter
]
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/rails'
require 'minitest/spec'
require 'capybara/rails'
require "minitest/pride"
require "minitest/focus"
require 'minitest/reporters'
require 'webmock/minitest'
require 'vcr_setup'
# require 'selenium-webdriver'

Minitest::Reporters.use! [ Minitest::Reporters::ProgressReporter.new ]

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include FactoryGirl::Syntax::Methods
end

class ActionView::TestCase::TestController
  include FactoryGirl::Syntax::Methods
end

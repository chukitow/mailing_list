require 'cucumber/rails'

ActionController::Base.allow_rescue = false
Capybara.default_driver = :selenium
WebMock.disable_net_connect!(:allow_localhost => true)

begin
  DatabaseCleaner.strategy = :truncation

  Before do
    DatabaseCleaner.start
  end

  After do |scenario|
    DatabaseCleaner.clean
  end

rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation


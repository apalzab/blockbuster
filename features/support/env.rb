ENV['RAILS_ENV'] = 'test'
require './config/environment'
require 'rspec/rails'
require 'spinach/capybara'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
Spinach.hooks.before_scenario{ DatabaseCleaner.clean }
Capybara.default_driver = :selenium

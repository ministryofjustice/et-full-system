require 'selenium-webdriver'
require_relative './capybara/capybara_driver_helper'
Capybara.configure do |c|
  c.save_path = File.absolute_path(File.join('..', '..', 'tmp', 'capybara'), __FILE__)
end
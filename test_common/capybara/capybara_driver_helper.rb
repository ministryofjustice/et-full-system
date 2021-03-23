require 'capybara'
require_relative '../configuration'
Capybara.configure do |config|
  driver = ENV.fetch('DRIVER', 'chromedriver').to_sym
  config.javascript_driver = driver
  config.default_max_wait_time = 10
  config.match = :prefer_exact
  config.exact = true
  config.ignore_hidden_elements = false
  config.visible_text_only = true
end

Capybara.register_driver :firefox do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.cache.disk.enable'] = false
  profile['browser.cache.memory.enable'] = false
  caps = Selenium::WebDriver::Remote::Capabilities.firefox(idle_timeout: 150)
  Capybara::Selenium::Driver.new(app, browser: :remote, desired_capabilities: caps, url: ENV.fetch('SELENIUM_URL', 'http://localhost:4444/wd/hub'))
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :remote, desired_capabilities: :chrome, url: ENV.fetch('SELENIUM_URL', 'http://localhost:4444/wd/hub'))
end

Capybara.register_driver :chromedriver do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--no-sandbox')
  options.add_argument('--ignore-certificate-errors')
  options.add_argument("proxy-server=#{EtFullSystem::Test::Configuration['proxy']}") if EtFullSystem::Test::Configuration['proxy']
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :chromedriver_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--no-sandbox')
  options.add_argument('--headless')
  options.add_argument('--ignore-certificate-errors')
  options.add_argument("proxy-server=#{EtFullSystem::Test::Configuration['proxy']}") if EtFullSystem::Test::Configuration['proxy']
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :firefoxdriver do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.register_driver :firefoxdriver_headless do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.headless!
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.register_driver :safari do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

## Saucelabs browsers ####

Capybara.register_driver :internet_explorer_saucelabs do |app|
  Capybara::Selenium::Driver.new(app, browser: :remote, desired_capabilities: :internet_explorer, url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub" )
end

Capybara.register_driver :firefox_saucelabs do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.cache.disk.enable'] = false
  profile['browser.cache.memory.enable'] = false
  caps = Selenium::WebDriver::Remote::Capabilities.firefox(idle_timeout: 150)
  Capybara::Selenium::Driver.new(app, browser: :remote, desired_capabilities: caps, url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub" )
end

Capybara.register_driver :chrome_saucelabs do |app|
  Capybara::Selenium::Driver.new(app, browser: :remote, desired_capabilities: :chrome, url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub" )
end

Capybara.register_driver :chromedriver_saucelabs do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--no-sandbox')
  options.add_argument('--ignore-certificate-errors')
  options.add_argument("proxy-server=#{EtFullSystem::Test::Configuration['proxy']}") if EtFullSystem::Test::Configuration['proxy']
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub" )
end

Capybara.register_driver :safari_saucelabs do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari, url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub" )
end


Capybara.always_include_port = true
Capybara.app_host = ENV.fetch('CAPYBARA_APP_HOST', "http://#{ENV.fetch('HOSTNAME', 'localhost')}")
Capybara.server_host = ENV.fetch('CAPYBARA_SERVER_HOST', ENV.fetch('HOSTNAME', 'localhost'))
Capybara.server_port = ENV.fetch('CAPYBARA_SERVER_PORT') if ENV['CAPYBARA_SERVER_PORT']

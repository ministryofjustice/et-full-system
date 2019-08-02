source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :test do
  gem 'rspec', '~> 3.7'
  gem 'capybara', '~> 3.10'
  gem 'site_prism', '~> 3.0'
  gem 'i18n', '~> 0.8'
  gem 'activesupport', '~> 5.2'
  gem 'selenium-webdriver', '~> 3.141'
  gem 'chromedriver-helper', '~> 1.1'
  gem 'geckodriver-helper', '~> 0.0'
  gem 'capybara-screenshot', '~> 1.0'
  gem 'cucumber', '~> 3.1'
  gem 'aws-sdk-s3', '~> 1.9'
  gem 'azure-storage', '~> 0.15.0.preview', require: false

  # Rubyzip used to test zip files
  gem 'rubyzip', '~> 1.2', '>= 1.2.1'
  # HTTParty - used to download from ATOS API during tests
  gem 'httparty', '~> 0.16.2'
  gem 'pry'
  # Pdf forms to test pdf content
  gem 'pdf-forms', '~> 1.1', '>= 1.1.1'
  gem 'factory_bot'
  gem 'settingslogic'
  gem 'mail'
  gem 'et_ccd_client', git: 'https://github.com/hmcts/et-ccd-client-ruby.git', tag: 'v0.1.34'
end

group :development, :test do
  gem 'ruby-debug-ide', '~> 0.6'
  gem 'debase', '~> 0.2'
  gem 'dotenv', '~> 2.2', '>= 2.2.2'
  gem 'faker', '~> 1.8', '>= 1.8.7'
  gem 'parallel_tests'
end

gem 'thor', '~> 0.20.3'
gem 'et_full_system', '~> 0.1.52'
gem 'rake'

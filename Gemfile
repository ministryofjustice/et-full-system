source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :test do
  gem 'rspec', '~> 3.7'
  gem 'capybara', '~> 2.17'
  gem 'site_prism', '~> 2.9'
  gem 'i18n', '~> 0.8'
  gem 'activesupport', '~> 5.1'
  gem 'selenium-webdriver', '~> 3.10'
  gem 'chromedriver-helper', '~> 1.1'
  gem 'geckodriver-helper', '~> 0.0'
  gem 'capybara-screenshot', '~> 1.0'

end
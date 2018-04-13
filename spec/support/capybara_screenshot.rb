require 'capybara-screenshot/rspec'
require_relative 'test_common'
RSpec.configure do |config|
  config.after do |example_from_block_arg|
    # RSpec 3 no longer defines `example`, but passes the example as block argument instead
    example = config.respond_to?(:expose_current_running_example_as) ? example_from_block_arg : self.example
    next unless EtFullSystem::Test::CommonAdminWindow.admin_window_opened?
    within_admin_window do
      Capybara::Screenshot::RSpec.after_failed_example(example)
    end
  end

end
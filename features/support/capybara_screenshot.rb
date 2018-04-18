require_relative './test_common'
require 'capybara-screenshot/cucumber'

After do |scenario|
  if Capybara::Screenshot.autosave_on_failure && scenario.failed?
    Capybara.using_session(Capybara::Screenshot.final_session_name) do
      filename_prefix = Capybara::Screenshot.filename_prefix_for(:cucumber, scenario) + "_admin"
      next unless EtFullSystem::Test::CommonAdminWindow.admin_window_opened?
      within_admin_window do
        saver = Capybara::Screenshot.new_saver(Capybara, Capybara.page, true, filename_prefix)
        saver.save
        saver.output_screenshot_path
      end
    end
  end
end

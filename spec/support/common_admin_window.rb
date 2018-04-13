require_relative 'test_common'

RSpec.configure do |c|
  c.include EtFullSystem::Test::CommonAdminWindow, type: :feature
  c.after(:suite) do
    EtFullSystem::Test::CommonAdminWindow.ensure_admin_window_closed
  end
end

require_relative '../../test_common/capybara'
require_relative '../../test_common/page_objects'
require_relative '../../test_common/personas'
require_relative '../../test_common/messaging'
require_relative '../../test_common/helpers'
require_relative '../../test_common/common_admin_window'
require_relative '../../test_common/video_recorder'
require_relative '../../test_common/atos_interface'
require_relative '../../test_common/rspec_eventually'
include EtFullSystem::Test::Setup
include EtFullSystem::Test::Pages
include EtFullSystem::Test::Et1ClaimHelper
include EtFullSystem::Test::CommonAdminWindow
include EtFullSystem::Test::AtosInterfaceHelper
After do
  EtFullSystem::Test::CommonAdminWindow.ensure_admin_window_closed
end
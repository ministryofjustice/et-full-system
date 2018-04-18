require_relative '../../test_common/capybara'
require_relative '../../test_common/page_objects'
require_relative '../../test_common/personas'
require_relative '../../test_common/messaging'
require_relative '../../test_common/helpers'
require_relative '../../test_common/common_admin_window'
require_relative '../../test_common/video_recorder'
include EtFullSystem::Test::Setup
include EtFullSystem::Test::Pages
include EtFullSystem::Test::Et1ClaimHelper
include EtFullSystem::Test::CommonAdminWindow
After do
  EtFullSystem::Test::CommonAdminWindow.ensure_admin_window_closed
end
require_relative '../../test_common/configuration'
require_relative '../../test_common/capybara'
require_relative '../../test_common/message_broadcast'
require_relative '../../test_common/page_objects'
require_relative '../../test_common/file_objects'
require_relative '../../test_common/messaging'
require_relative '../../test_common/helpers'
require_relative '../../test_common/common_admin_window'
require_relative '../../test_common/atos_interface'
require_relative '../../test_common/rspec_eventually'
require_relative '../../test_common/housekeeping'
require_relative '../../test_common/matchers'
require_relative '../../test_common/api/admin'
require_relative '../../test_common/ccd_config'
require_relative './ccd_support/ccd_office_lookup'
include EtFullSystem::Test::Pages
include EtFullSystem::Test::Et1ClaimHelper
include EtFullSystem::Test::Et3ResponseHelper
include EtFullSystem::Test::DiversityHelper
include EtFullSystem::Test::CommonAdminWindow
include EtFullSystem::Test::AtosInterfaceHelper
include EtFullSystem::Test::Housekeeping
include EtFullSystem::Test::Et1Export
include EtFullSystem::Test::Et3Export
include EtFullSystem::Test::CcdOfficeLookUp
include EtFullSystem::Test::Admin
include EtFullSystem::Test::CcdHelper
include EtFullSystem::Test::SettingsHelper
include EtFullSystem::Test::MessageBroadcast
Before do
  EtFullSystem::Test::CommonAdminWindow.reset
end
After do
  EtFullSystem::Test::CommonAdminWindow.ensure_admin_window_closed
end

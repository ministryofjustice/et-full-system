require 'et_test_helpers'
EtTestHelpers.config.translation = ->(key) { ::EtFullSystem::Test::Messaging.instance.t(key) }

require 'et_test_helpers'
EtTestHelpers.config.translation = ->(key, **kwargs) { ::EtFullSystem::Test::Messaging.instance.t(key, **kwargs) }

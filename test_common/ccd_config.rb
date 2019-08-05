require 'et_ccd_client'

EtCcdClient.config do |c|
  c.auth_base_url = EtFullSystem::Test::Configuration.ccd_auth_base_url
  c.idam_base_url = EtFullSystem::Test::Configuration.ccd_idam_base_url
  c.data_store_base_url = EtFullSystem::Test::Configuration.ccd_data_store_base_url
  rewrite = EtFullSystem::Test::Configuration.ccd_document_store_url_rewrite
  c.document_store_url_rewrite = rewrite == false ? false : rewrite.split(':')
  c.gateway_api_url = EtFullSystem::Test::Configuration.ccd_gateway_api_url
  c.jurisdiction_id = EtFullSystem::Test::Configuration.ccd_jurisdiction_id
  c.microservice = EtFullSystem::Test::Configuration.ccd_microservice
  c.microservice_secret = EtFullSystem::Test::Configuration.ccd_microservice_secret
  c.use_sidam = EtFullSystem::Test::Configuration.ccd_use_sidam
  c.sidam_username = EtFullSystem::Test::Configuration.ccd_sidam_username
  c.sidam_password = EtFullSystem::Test::Configuration.ccd_sidam_password
  c.case_management_ui_base_url = EtFullSystem::Test::Configuration.ccd_case_management_ui_base_url
  c.case_management_ui_redirect_url = EtFullSystem::Test::Configuration.ccd_case_management_ui_redirect_url
  c.verify_ssl = false
  c.logger = ::ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
  c.logger.level = ActiveSupport::Logger::DEBUG
end

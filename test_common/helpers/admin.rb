module EtFullSystem
  module Test
    module Admin
      def admin_api
        EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
      end
    end
  end
end

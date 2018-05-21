require 'singleton'
module EtFullSystem
  module Test
    class Configuration
      include Singleton
      def server_domain
        ENV.fetch('SERVER_DOMAIN', 'et.127.0.0.1.nip.io')
      end

      def server_port
        ENV.fetch('SERVER_PORT', '3100')
      end

      def admin_url
        ENV.fetch('ADMIN_BASE_URL', "http://admin.#{server_domain}:#{server_port}/admin")
      end

      def et1_url
        ENV.fetch('ET1_URL', "http://et1.#{server_domain}:#{server_port}/")
      end

      def et3_url
        ENV.fetch('ET3_URL', "http://et3.#{server_domain}:#{server_port}/")
      end

      def atos_api_url
        ENV.fetch('ATOS_API_URL', "http://api.#{server_domain}:#{server_port}/atos_api")
      end
    end
  end
end

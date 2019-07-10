require 'et_ccd_client'
module EtFullSystem
  module Test
    module Ccd
      def ccd
        return @ccd if defined?(@ccd)
        @ccd = ::EtCcdClient::UiClient.new
        @ccd.login(username: 'm@m.com', password: 'p')
        @ccd
      end
    end
  end
end
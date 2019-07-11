module EtFullSystem
  module Test
    module Ccd
      class Base
        def initialize(ccd)
          self.ccd = ccd
        end

        def ccd
          return @ccd if defined?(@ccd)
          @ccd = ::EtCcdClient::UiClient.new
          @ccd.login(username: 'm@m.com', password: 'p')
          @ccd
        end

        private

        attr_accessor :ccd
      end
    end
  end
end
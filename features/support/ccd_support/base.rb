module EtFullSystem
  module Test
    module Ccd
      class Base

        def self.ccd
          return @ccd if defined?(@ccd)
          @ccd = ::EtCcdClient::UiClient.new
          @ccd.login(username: 'm@m.com', password: 'Pa55word11')
          @ccd
        end

        def ccd
          self.class.ccd
        end
      end
    end
  end
end
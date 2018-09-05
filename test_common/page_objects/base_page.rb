require_relative '../sections'
require_relative '../messaging'
module EtFullSystem
  module Test
    # @abstract
    # @private
    class BasePage < ::SitePrism::Page
      include ::EtFullSystem::Test::I18n

      def messaging
        @messaging ||= ::EtFullSystem::Test::Messaging.instance
      end

      def load_page
        load
      end

      def back_via_browser_button
        page.evaluate_script('window.history.back()')
      end
    end
  end
end

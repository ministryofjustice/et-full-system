require_relative './base_page'
module EtFullSystem
  module Test
    module Et3
      class StartPage < BasePage
      set_url ENV.fetch('ET3_URL', 'http://et3:8080/')
      element :header, :css, ".content-header"
      element :introduction, :css, ".introduction"
      element :start_button, :css, ".button.button-start"
      def start_a_response
        start_button.click
      end   
    end   
    end
  end
end
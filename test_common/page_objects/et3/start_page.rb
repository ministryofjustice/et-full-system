require_relative './base_page'
module EtFullSystem
  module Test
    module Et3
      class StartPage < BasePage
        set_url ::EtFullSystem::Test::Configuration.et3_url
        element :header, :css, ".content-header"
        element :introduction, :css, ".introduction"
        element :start_button, :css, ".button.button-start"
        def next
          start_button.click
        end
      end
    end
  end
end
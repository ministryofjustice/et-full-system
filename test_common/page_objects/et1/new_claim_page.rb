require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class NewClaimPage < BasePage
        set_url ENV.fetch('ET1_URL', 'http://et1:8080/')
        section :main_content, '#content .main-section .main-content' do
          element :start_a_claim_link, 'input[value="Start a claim"]'
        end

        def start_a_claim
          main_content.start_a_claim_link.click
        end
      end
    end
  end
end
require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimSubmitted < BasePage
        section :main_content, '#content .main-section .main-content .content-section' do
          element :diversity_link, 'a[href="/apply/diversity"]'
        end

        def diversity_link
          main_content.diversity_link.click
        end
      end
    end
  end
end
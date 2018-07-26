require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimSubmitted < BasePage
        set_url '/apply/confirmation'
        section :main_content, '#content .main-section .main-content .content-section' do
          element :diversity_link, 'a[href="/apply/diversity"]'
          element :local_office_address, :css, '.confirmation-table tbody tr:nth-child(2) td'
        end

        def diversity_link
          main_content.diversity_link.click
        end
      end
    end
  end
end
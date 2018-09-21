require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimSubmitted < BasePage
        set_url '/apply/confirmation'
        section :main_content, '#content .main-section .main-content .content-section' do
          element :diversity_link, 'p a[href="/apply/diversity"]'
          section :confirmation_tabe, '.confirmation-table' do
            section :tbody, 'tbody' do
              element :local_office_address, :css, 'tr:nth-child(2) td'
              element :attachments, :css, 'tr:nth-child(3) td'
            end
          end
        end

        def diversity_link
          main_content.diversity_link.click
        end
      end
    end
  end
end
require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimSubmitted < BasePage
        set_url '/apply/confirmation'
        section :main_content, '.main-section .main-content' do
          element :claim_number, '.callout-confirmation .number'
          section :content_section, '.content-section' do
            element :diversity_link, 'p a[href="/apply/diversity"]'
            section :confirmation_table, '.confirmation-table' do
              section :tbody, 'tbody' do
                element :local_office_address, :css, 'tr:nth-child(2) td'
                element :attachments, :css, 'tr:nth-child(3) td'
              end
            end
          end
        end

        def diversity_link
          main_content.content_section.diversity_link.click
        end
      end
    end
  end
end
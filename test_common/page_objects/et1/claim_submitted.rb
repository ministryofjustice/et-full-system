require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimSubmitted < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #Claim submitted
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claim_confirmations.show.header', exact: false
        end
        section :main_content, '#content .main-section .main-content' do
          #Your claim number
          section :callout_confirmation, '.callout-confirmation' do
            element :your_claim_number, :paragraph, 'claim_confirmations.show.callout_detail'
            element :number, :number, ''
          end
          #What happens next
          element :what_happens_next, :content_header, 'claim_confirmations.show.what_happens_next.header'
          section :numerical_list, '.numerical-list' do
            element :send_to_respondent, :paragraph, 'claim_confirmations.show.what_happens_next.send_to_respondent'
            element :next_steps, :paragraph, 'claim_confirmations.show.what_happens_next.next_steps'
          end
          #Submission details
          section :confirmation_table, '.confirmation-table' do
            element :submission_details, :caption, 'claim_confirmations.show.submission_details.header'
            section :tbody, 'tbody' do
              section :download_application, :table_row_with_th_labelled, 'claim_confirmations.show.download_application.header' do
                element :answer, :return_diversity_answer
                element :download_application_link, :link_named, 'claim_confirmations.show.download_application.info'
                element :download_application_info, :link_named, 'claim_confirmations.show.download_application.info'
              end
              section :submission_information, :table_row_with_th_labelled, 'claim_confirmations.show.submission_details.submission_information' do
                element :answer, :return_diversity_answer
                element :submission_information_info, :td, 'claim_confirmations.show.submission_details.submission_with_office'
              end
              section :attachments, :table_row_with_th_labelled, 'claim_confirmations.show.submission_details.attachments' do
                element :answer, :return_diversity_answer
                element :attachments_info, :link_named, 'claim_confirmations.show.no_attachments'
              end
            end
          end
          element :print_this_page, :link_named, 'claim_confirmations.show.print_link_html'
          element :for_your_record, :paragraph, 'claim_confirmations.show.print_link_info'
          element :your_feedback, :link_named, 'claim_confirmations.show.feedback_html'
          element :your_feedback_info, :paragraph, 'claim_confirmations.show.feedback_info'
          element :diversity_info, :paragraph, 'claim_confirmations.show.diversity_html'
          element :diversity_link, :link_named, 'claim_confirmations.show.diveristy_link'
        end

        def diversity_link
          main_content.diversity_link.click
        end
      end
    end
  end
end
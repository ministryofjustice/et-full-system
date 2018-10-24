require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class RespondentsDetailsPage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #Representative's details
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claims.respondent.header', exact: false
        end
        section :main_content, '.main-section .main-content' do
          section :error_message, '#edit_claimant #error-summary' do
            element :error_summary, :content_header, 'shared.error_notification.error_summary', exact: false
            element :default_message, :paragraph, 'shared.error_notification.default_message'
          end
          #About the respondent
          element :representative_header, :legend_header, 'claims.respondent.respondent_legend'
          element :respondent_summary, :paragraph, ''
          element :name, 'input[name="respondent[name]"]'
          element :building, 'input[name="respondent[address_building]"]'
          element :street, 'input[name="respondent[address_street]"]'
          element :locality, 'input[name="respondent[address_locality]"]'
          element :county, 'input[name="respondent[address_county]"]'
          element :post_code, 'input[name="respondent[address_post_code]"]'
          element :telephone_number, 'input[name="respondent[address_telephone_number]"]'
          element :building, 'input[name="respondent[work_address_building]"]'
          element :street, 'input[name="respondent[work_address_street]"]'
          element :locality, 'input[name="respondent[work_address_locality]"]'
          element :county, 'input[name="respondent[work_address_county]"]'
          element :post_code, 'input[name="respondent[work_address_post_code]"]'
          element :telephone_number, 'input[name="respondent[work_address_telephone_number]"]'
          section :same_address, '.respondent_worked_at_same_address' do
            def set(value)
              choose value, name: 'respondent[worked_at_same_address]'
            end
          end
          element :certificate_number, 'input[name="respondent[acas_early_conciliation_certificate_number]"]'
          #Save and continue
          element :save_and_continue_button, :submit_text, 'helpers.submit.update', exact: false
        end
        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
          element :your_claim, :support_header, 'shared.aside.actions_header'
          element :save_and_complete_later, :button, 'shared.mobile_nav.save_and_complete'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(respondent)
          data = respondent[0].to_h
          return if data.nil? || data.empty?
          main_content.about_the_respondent do |s|
            set_field s, :name, data
            set_field s, :building, data
            set_field s, :street, data
            set_field s, :locality, data
            set_field s, :county, data
            set_field s, :post_code, data
            set_field s, :telephone_number, data
          end
          if data.key?(:work_address)
            address = data[:work_address].to_h
            main_content.your_work_address do |s|
              s.same_address.set('No')
              set_field s, :building, address
              set_field s, :street, address
              set_field s, :locality, address
              set_field s, :county, address
              set_field s, :post_code, address
              set_field s, :telephone_number, address
            end
          else
            main_content.your_work_address.same_address.set('Yes')
          end
          main_content.acas do |s|
            s.certificate_number.set data[:acas_number] if data.key?(:acas_number)
          end
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end
require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class MoreAboutTheClaimPage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #More about the claim
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claims.additional_information.header', exact: false
        end
        section :main_content, '#content .main-section .main-content' do
          section :other_important_details, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Other important details")]] }) do
            element :notes, 'textarea[name="additional_information[miscellaneous_information]"]'
            def set(value)
              choose value, name: "additional_information[has_miscellaneous_information]"
            end
          end

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

        def set_for(claim)
          data = claim.to_h
          return if data.nil?
          if data.key?(:other_important_details)
            main_content.other_important_details.set 'Yes'
            main_content.other_important_details.notes.set data[:other_important_details]
          else
            main_content.other_important_details.set 'No'
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
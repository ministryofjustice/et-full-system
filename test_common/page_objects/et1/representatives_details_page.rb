require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class RepresentativesDetailsPage < BasePage
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
          element :page_header, :page_title, 'claims.representative.header', exact: false
        end
        section :main_content, '.main-section .main-content' do
          section :error_message, '#edit_claimant #error-summary' do
            element :error_summary, :content_header, 'shared.error_notification.error_summary', exact: false
            element :default_message, :paragraph, 'shared.error_notification.default_message'
          end
          #People making a claim with you
          element :legend_representative, :legend_header, 'claims.representative.form_legend', exact: false
          section :representative_has_representative, '.additional_claimants_of_collection_type' do
            include ::EtFullSystem::Test::I18n
            element :group_claims, :form_labelled, 'simple_form.labels.representative.has_representative'
            element :yes, :form_labelled, 'simple_form.yes' do
              element :selector, :css, 'input'
              delegate :set, to: :selector
            end
            element :no, :form_labelled, 'simple_form.no' do
              element :selector, :css, 'input'
              delegate :set, to: :selector
            end
            def set(value)
              choose(factory_translate(value), name: "additional_claimants[of_collection_type]")
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

        section :main_content, '#content .main-section .main-content' do
          section :representatives_details, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("The person representing you")]] }) do
            section :representative, ".representative_has_representative" do
              def set(value)
                choose(value)
              end
            end
            section :about_your_representative, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("About your representative")]] }) do
              section :type, 'select[name="representative[type]"]' do
                def set(value)
                  root_element.select(value)
                end
              end
              element :organisation_name, 'input[name="representative[organisation_name]"]'
              element :name, 'input[name="representative[name]"]'
            end
            section :contact_details, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Representative’s contact details")]] }) do
              element :building, 'input[name="representative[address_building]"]'
              element :street, 'input[name="representative[address_street]"]'
              element :locality, 'input[name="representative[address_locality]"]'
              element :county, 'input[name="representative[address_county]"]'
              element :post_code, 'input[name="representative[address_post_code]"]'
              section :country, 'select[name="representative[address_country]"]' do
                def set(value)
                  root_element.select(value)
                end
              end
              element :telephone_number, 'input[name="representative[address_telephone_number]"]'
              element :alternative_telephone_number, 'input[name="representative[mobile_number]"]'
              element :email_address, 'input[name="representative[email_address]"]'
              element :dx_number, 'input[name="representative[dx_number]"]'
            end
          end
          
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end
      end
    end
  end
end
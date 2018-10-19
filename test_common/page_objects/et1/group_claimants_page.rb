require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class GroupClaimantsPage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #Group claims
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claims.additional_claimants.header', exact: false
        end
        section :main_content, '.main-section .main-content' do
          section :error_message, '#edit_claimant #error-summary' do
            element :error_summary, :content_header, 'shared.error_notification.error_summary', exact: false
            element :default_message, :paragraph, 'shared.error_notification.default_message'
          end
          #People making a claim with you
          element :legend_group_claims, :legend_header, 'claims.additional_claimants.subheader', exact: false
          section :additional_claimants_of_collection_type, '.additional_claimants_of_collection_type' do 
            element :group_claims, :form_labelled, 'simple_form.labels.additional_claimants.of_collection_type'
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
          element :upload_link, :link, "upload their details in a separate spreadsheet"

          (2..6).each_with_index do |number, idx|
            section :"about_claimant_#{number}", :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Claimant #{idx + 2}")]] }) do
              section :title, "select[name=\"additional_claimants[collection_attributes][#{idx}][title]\"]" do
                def set(value)
                  root_element.select(value)
                end
              end
              element :first_name, "input[name=\"additional_claimants[collection_attributes][#{idx}][first_name]\"]"
              element :last_name, "input[name=\"additional_claimants[collection_attributes][#{idx}][last_name]\"]"
              section :date_of_birth, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Date of birth")]] }) do
                element :day, "input[name=\"additional_claimants[collection_attributes][#{idx}][date_of_birth][day]\"]"
                element :month, "input[name=\"additional_claimants[collection_attributes][#{idx}][date_of_birth][month]\"]"
                element :year, "input[name=\"additional_claimants[collection_attributes][#{idx}][date_of_birth][year]\"]"
                def set(value)
                  (day_value, month_value, year_value) = value.split("/")
                  day.set(day_value)
                  month.set(month_value)
                  year.set(year_value)
                end
              end
              element :building, "input[name=\"additional_claimants[collection_attributes][#{idx}][address_building]\"]"
              element :street, "input[name=\"additional_claimants[collection_attributes][#{idx}][address_street]\"]"
              element :locality, "input[name=\"additional_claimants[collection_attributes][#{idx}][address_locality]\"]"
              element :county, "input[name=\"additional_claimants[collection_attributes][#{idx}][address_county]\"]"
              element :post_code, "input[name=\"additional_claimants[collection_attributes][#{idx}][address_post_code]\"]"
            end
          end
          element :add_more_claimants_link, 'input[value="Add more claimants"]'
          #save and continue
          element :save_and_continue_button, 'form.edit_additional_claimants input[value="Save and continue"]'
        end
        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
          element :your_claim, :support_header, 'shared.aside.actions_header'
          element :save_and_complete_later, :button, 'shared.mobile_nav.save_and_complete'
        end

        def set_for(users)
          group_claims_csv = users[0].dig(:group_claims_csv)
          if users.length > 1 || group_claims_csv.present?
            main_content.group_claims.set('Yes')
            users.each.with_index do |claim, idx|
              add_more_claimants unless idx == 0
              populate_group_claim_section(users[0].to_h, idx + 2)
            end
            main_content.group_claims.upload_link.click if group_claims_csv.present?
          else
            main_content.group_claims.set('No')
          end
        end

        def add_more_claimants
          main_content.group_claims.add_more_claimants_link.click
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def has_correct_translation_on_group_claims?
          #your feedback header
          expect(feedback_notice).to have_language
          expect(feedback_notice).to have_feedback_link
          #Page header
          expect(main_header).to have_page_header
          #people making a claim with you
          expect(main_content).to have_legend_group_claims
          expect(main_content.additional_claimants_of_collection_type).to have_group_claims
          expect(main_content.additional_claimants_of_collection_type).to have_yes
          expect(main_content.additional_claimants_of_collection_type).to have_no
          #Support links
          expect(support).to have_suport_header
          expect(support).to have_guide
          expect(support).to have_contact_use
          #Save your claim later
          expect(support).to have_your_claim
          #TODO this has stopped working - why?
          # expect(support).to have_save_and_complete_later
        end

        private

        def upload_page
          AdditionalClaimantsUploadPage.new
        end

      end
    end
  end
end

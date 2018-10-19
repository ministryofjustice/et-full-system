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
            include ::EtFullSystem::Test::I18n
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
              choose(factory_translate(value), name: "claims.additional_claimants.additional_claimants[of_collection_type]")
            end

            section :number_claimants_info, '#number_claimants_info' do
              element :number_claimants_info, :balh, 'claims.additional_claimants.number_claimants_info'
              element :csv_upload_text_html, :sdfs, 'claims.additional_claimants.csv_upload_text_html'
              element :upload_link, :link, 'claims.additional_claimants.csv_upload_text_html'
            end
          end
          
          (2..6).each_with_index do |number, idx|
            section :"about_claimant_#{number}", :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Claimant #{idx + 2}")]] }) do
              #title
          section :title, :question_labelled, 'simple_form.labels.representative.title' do
            def set(value)
              root_element.select(value)
            end
            element :error_title, :error, 'activemodel.errors.models.representative.attributes.title.blank', exact: false
          end
          #first name
          section :first_name, :question_labelled, 'simple_form.labels.representative.first_name' do
            element :field, :css, 'input'
            delegate :set, to: :field
            element :error_first_name, :error, 'activemodel.errors.models.representative.attributes.first_name.blank'
          end
          #lastname name
          section :last_name, :question_labelled, 'simple_form.labels.representative.last_name' do
            element :field, :css, 'input'
            delegate :set, to: :field
            element :error_last_name, :error, 'activemodel.errors.models.representative.attributes.last_name.blank'
          end
          #Date of birth
          section :date_of_birth, :legend_header, 'claims.personal_details.date_of_birth', exact: false do
            element :error_date_of_birth, :error, 'activemodel.errors.models.representative.attributes.date_of_birth.too_young'
            element :date_of_birth_hint, :paragraph, 'simple_form.hints.representative.date_of_birth'
            section :day, :question_labelled, 'simple_form.labels.representative.date_of_birth.day' do
              element :field, :css, '#claimant_date_of_birth_day'
              delegate :set, to: :field
            end
            section :month, :question_labelled, 'simple_form.labels.representative.date_of_birth.month' do
              element :field, :css, '#claimant_date_of_birth_month'
              delegate :set, to: :field
            end
            section :year, :question_labelled, 'simple_form.labels.representative.date_of_birth.year' do
              element :field, :css, '#claimant_date_of_birth_year'
              delegate :set, to: :field
            end
            def set(value)
              (day_value, month_value, year_value) = value.split("/")
              day.set(day_value)
              month.set(month_value)
              year.set(year_value)
            end
            element :error_building, :error, 'activemodel.errors.models.representative.attributes.address_building.blank'
            section :street, :question_labelled, 'simple_form.labels.representative.address_street' do
              element :field, :css, 'input'
              delegate :set, to: :field
            end
            element :error_street, :error, 'activemodel.errors.models.representative.attributes.address_street.blank'
            section :locality, :question_labelled, 'simple_form.labels.representative.address_locality' do
              element :field, :css, 'input'
              delegate :set, to: :field
            end
            element :error_locality, :error, 'activemodel.errors.models.representative.attributes.address_locality.blank'
            #County
            section :county, :question_labelled, 'simple_form.labels.representative.address_county' do
              element :field, :css, 'input'
              delegate :set, to: :field
            end
            element :error_county, :error, 'activemodel.errors.models.representative.attributes.address_county.blank'
            element :county_hint, :paragraph, 'simple_form.hints.representative.address_county', exact: false
            section :post_code, :question_labelled, 'simple_form.labels.representative.address_post_code' do
              element :field, :css, 'input'
              delegate :set, to: :field
            end
          end
          element :add_more_claimants_link, 'input[value="Add more claimants"]'
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
          #save and continue
          expect(main_content).to have_save_and_continue_button
          #Support links
          expect(support).to have_suport_header
          expect(support).to have_guide
          expect(support).to have_contact_use
          #Save your claim later
          expect(support).to have_your_claim
          #TODO this has stopped working - why?
          # expect(support).to have_save_and_complete_later
        end

        def has_correct_translation_for_group_claimants?
          #People making a claim with you
        end

        private

        def upload_page
          AdditionalClaimantsUploadPage.new
        end

      end
    end
  end
end

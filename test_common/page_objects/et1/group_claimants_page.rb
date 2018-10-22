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
          end

          section :number_claimants_info, '#number_claimants_info' do
            element :five_more_claimants, :panel_indent, 'claims.additional_claimants.number_claimants_info', exact: false
            element :six_more_claimants, :panel_indent, 'claims.additional_claimants.csv_upload_text_html', exact: false
            element :csv_upload_link, :link_named, 'claims.additional_claimants.csv_upload_link', exact: false
          end
            (2..6).each_with_index do |number, idx|
            section :"about_claimant_#{number}", :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Claimant #{idx + 2}")]] }) do
              # section :"about_claimant_#{number}", :group_claimants, "claims.additional_claimants.person", number: idx+2 do
                section :title, :question_labelled, 'simple_form.labels.claimant.title' do
                  include ::EtFullSystem::Test::I18n
                  def set(value)
                    root_element.select(factory_translate(value))
                  end
                end
                #first name
                section :first_name, :question_labelled, 'simple_form.labels.claimant.first_name' do
                  element :field, :css, 'input'
                  delegate :set, to: :field
                end
                #lastname name
                section :last_name, :question_labelled, 'simple_form.labels.claimant.last_name' do
                  element :field, :css, 'input'
                  delegate :set, to: :field
                end
                #Date of birth
                section :date_of_birth, :legend_header, 'claims.personal_details.date_of_birth', exact: false do
                  element :date_of_birth_hint, :paragraph, 'simple_form.hints.claimant.date_of_birth'
                  section :day, :question_labelled, 'simple_form.labels.claimant.date_of_birth.day' do
                    element :field, :css, 'input'
                    delegate :set, to: :field
                  end
                  section :month, :question_labelled, 'simple_form.labels.claimant.date_of_birth.month' do
                    element :field, :css, 'input'
                    delegate :set, to: :field
                  end
                  section :year, :question_labelled, 'simple_form.labels.claimant.date_of_birth.year' do
                    element :field, :css, 'input'
                    delegate :set, to: :field
                  end
                  def set(value)
                    (day_value, month_value, year_value) = value.split("/")
                    day.set(day_value)
                    month.set(month_value)
                    year.set(year_value)
                  end
                end
                #Building number or name
                section :building, :question_labelled, 'simple_form.labels.claimant.address_building' do
                  element :field, :css, 'input'
                  delegate :set, to: :field
                end
                #Street
                section :street, :question_labelled, 'simple_form.labels.claimant.address_street' do
                  element :field, :css, 'input'
                  delegate :set, to: :field
                end
                #Town/city
                section :locality, :question_labelled, 'simple_form.labels.claimant.address_locality' do
                  element :field, :css, 'input'
                  delegate :set, to: :field
                end
                #County
                section :county, :question_labelled, 'simple_form.labels.claimant.address_county' do
                  element :field, :css, 'input'
                  delegate :set, to: :field
                end
                #Postcode
                section :post_code, :question_labelled, 'simple_form.labels.claimant.address_post_code' do
                  element :field, :css, 'input'
                  delegate :set, to: :field
                end
              end
            end
          element :add_more_claimants_link, :submit_text, 'claims.additional_claimants.add_fields'
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

        def add_more_claimants
          main_content.add_more_claimants_link.click
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def has_correct_translation_on_group_claims?
          #your feedback header
          expect(feedback_notice).to have_language
          expect(feedback_notice).to have_feedback_link
          #Group claims
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
          #For 5 or fewer claimants, enter their details below
          expect(main_content.number_claimants_info).to have_five_more_claimants
          #For 6 or more claimants, you can upload their details in a separate spreadsheet.
          expect(main_content.number_claimants_info).to have_six_more_claimants
          expect(main_content.number_claimants_info).to have_csv_upload_link
          #Claimant 2
          expect(main_content).to have_title
          expect(main_content).to have_first_name
          expect(main_content).to have_last_name
          #date of birth
          expect(main_content).to have_date_of_birth
          expect(main_content.date_of_birth).to have_date_of_birth_hint
          expect(main_content.date_of_birth).to have_day
          expect(main_content.date_of_birth).to have_month
          expect(main_content.date_of_birth).to have_year
          expect(main_content).to have_building
          expect(main_content).to have_street
          expect(main_content).to have_locality
          expect(main_content).to have_county
          expect(main_content).to have_post_code
          #Add more claimants
          expect(main_content).to have_add_more_claimants_link
        end

        def set(data)
          group_claims_csv = data[0].dig(:group_claims_csv)
          if data.length > 1 || group_claims_csv.present?
            main_content.additional_claimants_of_collection_type.yes.click
            data.each.with_index do |claim, idx|
              add_more_claimants unless idx == 0
              populate_group_claim_section(data[0].to_h, idx + 2)
            end
            main_content.number_claimants_info.csv_upload_link.click if group_claims_csv.present?
          else
            main_content.additional_claimants_of_collection_type.no.click
          end
        end

        private

        def upload_page
          AdditionalClaimantsUploadPage.new
        end

        def populate_group_claim_section(claimant_data, claimant_number)
          s = main_content.send(:"about_claimant_#{claimant_number}")
          set_field s, :title, claimant_data
          set_field s, :first_name, claimant_data
          set_field s, :last_name, claimant_data
          set_field s, :date_of_birth, claimant_data
          set_field s, :building, claimant_data
          set_field s, :street, claimant_data
          set_field s, :locality, claimant_data
          set_field s, :county, claimant_data
          set_field s, :post_code, claimant_data

          # main_content.title.set(claimant_data[:title])
          # main_content.first_name.set(claimant_data[:first_name])
          # main_content.last_name.set(claimant_data[:last_name])
          # main_content.date_of_birth.set(claimant_data[:date_of_birth])
          # main_content.building.set(claimant_data[:building])
          # main_content.street.set(claimant_data[:street])
          # main_content.locality.set(claimant_data[:locality])
          # main_content.county.set(claimant_data[:county])
          # main_content.post_code.set(claimant_data[:post_code])
        end

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end

      end
    end
  end
end

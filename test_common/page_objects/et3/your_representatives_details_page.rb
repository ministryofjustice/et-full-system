require_relative './base_page'
module EtFullSystem
  module Test
    module Et3
      class YourRepresentativesDetailsPage < BasePage
        include RSpec::Matchers
        section :switch_language, '.switch-language' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end
        element :error_header, :error_titled, 'errors.header', exact: true
        section :type_of_representative_question, :single_choice_option, 'questions.type_of_representative.label', exact: false do
          include ::EtFullSystem::Test::I18n
          section :citizens_advice_bureau, :gds_multiple_choice_option, 'questions.type_of_representative.citizens_advice_bureau.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :free_representation_unit, :gds_multiple_choice_option, 'questions.type_of_representative.free_representation_unit.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :law_centre, :gds_multiple_choice_option, 'questions.type_of_representative.law_centre.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :union, :gds_multiple_choice_option, 'questions.type_of_representative.union.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :solicitor, :gds_multiple_choice_option, 'questions.type_of_representative.solicitor.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :private_individual, :gds_multiple_choice_option, 'questions.type_of_representative.private_individual.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :trade_association, :gds_multiple_choice_option, 'questions.type_of_representative.trade_association.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :other, :gds_multiple_choice_option, 'questions.type_of_representative.other.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false
          def set_for(user)
            case user.type
              when 'Citizens advice bureau'
                citizens_advice_bureau.set(true)
              when 'Free representation unit'
                free_representation_unit.set(true)
              when 'Law centre'
                law_centre.set(true)
              when 'Union'
                union.set(true)
              when 'Solicitor'
                solicitor.set(true)
              when 'Private individual'
                private_individual.set(true)
              when 'Trade association'
                trade_association.set(true)
              when 'Other'
                other.set(true)
            end
          end
        end
        section :representative_org_name_question, :question_labelled, 'questions.representative_org_name.label', exact: false do
          element :field, :css, "input"
          def set(*args); field.set(*args); end
        end
        section :representative_name_question, :question_labelled, 'questions.representative_name.label', exact: false do
          element :field, :css, "input"
          element :error_contains_numbers, :exact_error_text, 'errors.messages.contains_numbers', exact: false
          def set(*args); field.set(*args); end
        end
        section :representative_building_question, :question_labelled, 'questions.representative_building.label', exact: false do
          element :field, :css, "input"
          element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
          def set(*args); field.set(*args); end
        end
        section :representative_street_question, :question_labelled, 'questions.representative_street.label', exact: false do
          element :field, :css, "input"
          element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
          def set(*args); field.set(*args); end
        end
        section :representative_town_question, :question_labelled, 'questions.representative_town.label', exact: false do
          element :field, :css, "input"
          element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
          def set(*args); field.set(*args); end
        end
        section :representative_county_question, :question_labelled, 'questions.representative_county.label', exact: false do
          element :field, :css, "input"
          def set(*args); field.set(*args); end
        end
        section :representative_postcode_question, :question_labelled, 'questions.representative_postcode.label', exact: false do
          element :field, :css, "input"
          element :error_invalid, :exact_error_text, 'errors.messages.invalid', exact: false
          def set(*args); field.set(*args); end
        end
        section :representative_phone_question, :question_labelled, 'questions.representative_phone.label', exact: false do
          element :field, :css, "input"
          element :error_invalid, :exact_error_text, 'errors.messages.invalid', exact: false
          def set(*args); field.set(*args); end
        end
        section :representative_mobile_question, :question_labelled, 'questions.representative_mobile.label', exact: false do
          element :field, :css, "input"
          element :error_invalid, :exact_error_text, 'errors.messages.invalid', exact: false
          def set(*args); field.set(*args); end
        end
        section :representative_dx_number_question, :question_labelled, 'questions.representative_dx_number.label', exact: false do
          element :field, :css, "input"
          def set(*args); field.set(*args); end
        end
        section :representative_reference_question, :question_labelled, 'questions.representative_reference.label', exact: false do
          element :field, :css, "input"
          def set(*args); field.set(*args); end
        end
        section :representative_contact_preference_question, :single_choice_option, 'questions.representative_contact_preference.label', exact: false do
          section :select_email, :gds_multiple_choice_option, 'questions.representative_contact_preference.email.label' do
            element :selector, :css, 'input[type="radio"]'
            def set(*args); selector.set(*args); end
          end
          section :select_post, :gds_multiple_choice_option, 'questions.representative_contact_preference.post.label' do
            element :selector, :css, 'input[type="radio"]'
            def set(*args); selector.set(*args); end
          end
          section :select_fax, :gds_multiple_choice_option, 'questions.representative_contact_preference.fax.label' do
            element :selector, :css, 'input[type="radio"]'
            def set(*args); selector.set(*args); end
          end
          section :preference_email, :inputtext_labelled, 'questions.representative_contact_preference.email.input_label' do
            def set(*args); root_element.set(*args); end
          end
          section :preference_fax, :inputtext_labelled, 'questions.representative_contact_preference.fax.input_label' do
            def set(*args); root_element.set(*args); end
          end
          element :error_invalid, :exact_error_text, 'errors.messages.invalid', exact: false
          def set_for(user)
            case user.representative_contact_preference
              when "Email"
                select_email.set(true)
                preference_email.set(user.representative_email)
              when "Post"
                select_post.set(true)
              when "Fax"
                select_fax.set(true)
                preference_fax.set(user.representative_fax)
            end
          end
        end
        # Save and continue
        element :continue_button, :submit_text, 'components.save_and_continue_button'
        def next
          continue_button.click
        end

        def switch_to_welsh
          switch_language.welsh_link.click
        end
  
        def switch_to_english
          switch_language.english_link.click
        end
      end
    end
  end
end

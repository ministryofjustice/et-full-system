require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class AdditionalRespondentsDetailsPage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #Additional respondents
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claims.additional_respondents.header', exact: false
        end
        section :main_content, '#content .main-section .main-content' do
          section :more_than_one_employer, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Claims against more than one employer")]] }) do
            def set(value)
              choose value, name: "additional_respondents[of_collection_type]"
            end
            [2, 3, 4, 5].each_with_index do |number, idx|
              section :"respondent_#{number}", :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Respondent #{idx + 2}")]] }) do |*_args|
                element :name, "input[name=\"additional_respondents[collection_attributes][#{idx}][name]\"]"
                element :building, "input[name=\"additional_respondents[collection_attributes][#{idx}][address_building]\"]"
                element :street, "input[name=\"additional_respondents[collection_attributes][#{idx}][address_street]\"]"
                element :locality, "input[name=\"additional_respondents[collection_attributes][#{idx}][address_locality]\"]"
                element :county, "input[name=\"additional_respondents[collection_attributes][#{idx}][address_county]\"]"
                element :post_code, "input[name=\"additional_respondents[collection_attributes][#{idx}][address_post_code]\"]"
                element :telephone_number, "input[name=\"additional_respondents[collection_attributes][#{idx}][address_telephone_number]\"]"
                element :acas_number, "input[name=\"additional_respondents[collection_attributes][#{idx}][acas_early_conciliation_certificate_number]\"]"
              end
            end
            element :add_another_respondent, 'input[value="Add another respondent"]'
          end
          element :save_and_continue_button, 'form.edit_additional_respondents input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set(respondents)
          return if respondents.nil? || respondents.empty?
          if respondents.length == 1
            main_content.more_than_one_employer.set('No')
          else
            main_content.more_than_one_employer do |s|
              s.set('Yes')
              respondents[1..-1].each_with_index do |respondent, idx|
                s.add_another_respondent.click unless idx == 0
                populate_respondent s.send(:"respondent_#{idx + 2}"), respondent.to_h
              end
            end
          end
        end

        private

        def populate_respondent(section, respondent)
          set_field section, :name, respondent
          set_field section, :building, respondent
          set_field section, :street, respondent
          set_field section, :locality, respondent
          set_field section, :county, respondent
          set_field section, :post_code, respondent
          set_field section, :acas_number, respondent
        end

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end
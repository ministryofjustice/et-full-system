require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class SubmissionFormPage < BasePage
        include RSpec::Matchers
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end
        #Check your answers
        element :header, :main_header, 'diversities.review.hint'
        section :main_content, '#main-content' do
          include EtTestHelpers::Section
          section :summary, :govuk_summary_list do
            #What is the type of your claim?
            section :claim_type_row, :govuk_summary_list_row, :'summary.claim' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #What is your sex?
            section :sex_row, :govuk_summary_list_row, :'summary.sex' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #What is your gender identity?
            section :gender_row, :govuk_summary_list_row, :'summary.gender' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #Is your gender identity different to the sex you were assumed to be at birth?
            section :gender_at_birth_row, :govuk_summary_list_row, :'summary.gender_at_birth' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #Which of the options below best describes your sexual identity?
            section :sexual_identity_row, :govuk_summary_list_row, :'summary.sexual_identity' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #What is your relationship status?
            section :relationship_row, :govuk_summary_list_row, :'summary.relationship' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #Which age group are you in?
            section :age_row, :govuk_summary_list_row, :'summary.age' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #Do you have any caring responsibilities?
            section :care_row, :govuk_summary_list_row, :'summary.care' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #What is your religion?
            section :religion_row, :govuk_summary_list_row, :'summary.religion' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #What is your ethnic group?
            section :ethnicity_group_row, :govuk_summary_list_row, :'summary.ethnicity_group' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #What is your ethnic type?
            section :ethnicity_type_row, :govuk_summary_list_row, :'summary.ethnicity_type' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #Do you have any physical or mental health conditions or illnesses lasting or expected to last for 12 months or more?
            section :health_row, :govuk_summary_list_row, :'summary.health' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
            #Were you pregnant when you were dismissed?
            section :pregnancy_row, :govuk_summary_list_row, :'summary.pregnancy' do
              element :answer, :govuk_summary_list_col
              element :link, :link_named, 'diversities.edit'
            end
          end

          #Submit form
          gds_submit_button :submit_form, :'diversities.show.submit'
        end

        def submit_form
          main_content.submit_form.click
        end

        def switch_to_welsh
          feedback_notice.welsh_link.click
        end

        def switch_to_english
          feedback_notice.english_link.click
        end

        def has_correct_data_populated?(diversity)
          data = diversity_data?(diversity)
          expect(feedback_notice).to have_language
          expect(self).to have_header
          expect(main_content.summary.claim_type_row).to have_answer(text: data[:claim_type])
          expect(main_content.summary.sex_row).to have_answer(text: data[:sex])
          expect(main_content.summary.sexual_identity_row).to have_answer(text: data[:sexual_identity])
          expect(main_content.summary.relationship_row).to have_answer(text: data[:relationship])
          expect(main_content.summary.age_row).to have_answer(text: data[:age_group])
          expect(main_content.summary.care_row).to have_answer(text: data[:caring_responsibility])
          expect(main_content.summary.religion_row).to have_answer(text: data[:religion])
          expect(main_content.summary.ethnicity_group_row).to have_answer(text: data[:ethnicity])
          expect(main_content.summary.ethnicity_type_row).to have_answer(text: data[:ethnicity_type]) if data[:ethnicity_type] != nil
          expect(main_content.summary.health_row).to have_answer(text: data[:disability])
          expect(main_content.summary.pregnancy_row).to have_answer(text: data[:pregnancy])
        end

        def diversity_data?(diversity)
          return diversity.to_h.inject({}) do |acc, (k,v)|
            acc[k] = factory_translate(v)
            acc
          end
        end

      end
    end
  end
end

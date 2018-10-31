require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class SubmissionFormPage < BasePage
        include RSpec::Matchers
        set_url "#{::EtFullSystem::Test::Configuration.diversity_url}/review"
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end
        section :main_content, '.container' do
          #Check your answers
          element :header, :main_header, 'diversities.review.hint'
          #What is the type of your claim?
          section :claim_type_row, :table_row_with_th_labelled, 'diversities.claim_type.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #What is your sex?
          section :sex_row, :table_row_with_th_labelled, 'diversities.sex.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #What is your gender identity?
          section :gender_row, :table_row_with_th_labelled, 'diversities.gender.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #Is your gender identity different to the sex you were assumed to be at birth?
          section :gender_at_birth_row, :table_row_with_th_labelled, 'diversities.gender_at_birth.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #Which of the options below best describes your sexual identity?
          section :sexual_identity_row, :table_row_with_th_labelled, 'diversities.sexual_identity.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #What is your relationship status?
          section :relationship_row, :table_row_with_th_labelled, 'diversities.relationship.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #Which age group are you in?
          section :age_row, :table_row_with_th_labelled, 'diversities.age.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #Do you have any caring responsibilities?
          section :care_row, :table_row_with_th_labelled, 'diversities.care.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #What is your religion?
          section :religion_row, :table_row_with_th_labelled, 'diversities.religion.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #What is your ethnic group?
          section :ethnicity_row, :table_row_with_th_labelled, 'diversities.ethnicity.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #What is your ethnic type?
          section :ethnicity_type_row, :table_row_with_th_labelled, 'diversities.ethnicity_type.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #Do you have any physical or mental health conditions or illnesses lasting or expected to last for 12 months or more?
          section :health_row, :table_row_with_th_labelled, 'diversities.health.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #Were you pregnant when you were dismissed?
          section :pregnancy_row, :table_row_with_th_labelled, 'diversities.pregnancy.hint' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'diversities.edit'
          end
          #Submit form
          element :submit_form, :submit_text, 'diversities.show.submit'
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

        def has_correct_translation?
          expect(feedback_notice).to have_language
          expect(main_content).to have_header
          expect(main_content.claim_type_row).to have_link
          expect(main_content.sex_row).to have_link
          expect(main_content.gender_row).to have_link
          expect(main_content.gender_at_birth_row).to have_link
          expect(main_content.sexual_identity_row).to have_link
          expect(main_content.relationship_row).to have_link
          expect(main_content.age_row).to have_link
          expect(main_content.care_row).to have_link
          expect(main_content.religion_row).to have_link
          expect(main_content.ethnicity_row).to have_link
          expect(main_content.ethnicity_type_row).to have_link if main_content.has_ethnicity_type_row?
          expect(main_content.health_row).to have_link
          expect(main_content.pregnancy_row).to have_link
        end

      end
    end
  end
end
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
          element :header, :main_header, 'submission.header'
          section :claim_type_row, :table_row_with_th_labelled, 'submission.claim_type' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :sex_row, :table_row_with_th_labelled, 'submission.sex' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :gender_row, :table_row_with_th_labelled, 'submission.gender' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :gender_at_birth_row, :table_row_with_th_labelled, 'submission.gender_at_birth' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :sexual_identity_row, :table_row_with_th_labelled, 'submission.sexual_identity' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :relationship_row, :table_row_with_th_labelled, 'submission.relationship' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :age_row, :table_row_with_th_labelled, 'submission.age' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :care_row, :table_row_with_th_labelled, 'submission.care' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :religion_row, :table_row_with_th_labelled, 'submission.religion' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :ethnicity_row, :table_row_with_th_labelled, 'submission.ethnicity' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :ethnicity_type_row, :table_row_with_th_labelled, 'submission.ethnicity_type' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :health_row, :table_row_with_th_labelled, 'submission.health' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          section :pregnancy_row, :table_row_with_th_labelled, 'submission.pregnancy' do
            element :answer, :return_diversity_answer
            element :link, :link_named, 'submission.change_link'
          end
          element :submit_form, 'input[value="Submit Form"]'
        end

        def submit_form
          main_content.submit_form.click
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
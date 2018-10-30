require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimOutcomePage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #Claim outcome
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claims.claim_outcome.header', exact: false
        end
        section :main_content, '#content .main-section .main-content' do

          section :preferred_outcome, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Choose your preferred outcome(s)")]] }) do
            include ::EtFullSystem::Test::I18n
            element :notes, 'textarea[name="claim_outcome[other_outcome]"]'
            def set(value)
              check factory_translate(value)
            end
          end

          element :save_and_continue_button, 'form.edit_claim_outcome input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(claim)
          data = claim.to_h
          return if data.nil?
          main_content.preferred_outcome do |s|
            s.set data[:preferred_outcome] if data.key?(:preferred_outcome)
            s.notes.set data[:preferred_outcome_notes] if data.key?(:preferred_outcome_notes)
          end
        end
      end
    end
  end
end

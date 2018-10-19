require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class GroupClaimsUploadPage < BasePage
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
          element :page_header, :page_title, 'claims.claimant.header', exact: false
        end
        section :main_content, '.main-section .main-content' do
          section :error_message, '#edit_claimant #error-summary' do
            element :error_summary, :content_header, 'shared.error_notification.error_summary', exact: false
            element :default_message, :paragraph, 'shared.error_notification.default_message'
          end
          #People making a claim with you
          element :legend_group_claims, :legend_header, 'claims.claimant.legend_personal_details', exact: false
        end

        section :main_content, '#content .main-section .main-content' do
          section :group_claims, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("People making a claim with you")]] }) do
            section :file_upload, :field, 'Upload spreadsheet (optional)' do
              def set(value)
                browser = page.driver.browser
                if browser.respond_to?(:file_detector=)
                  old_file_detector = browser.send(:bridge).file_detector
                  browser.file_detector = lambda do |args|
                    args.first.to_s
                  end
                end
                root_element.set(value)
              ensure
                browser.file_detector = old_file_detector if browser && browser.respond_to?(:file_detector=)
              end

            end
            def set(value)
              choose(value, name: "additional_claimants_upload[has_additional_claimants]")
            end

          end
          #Save and continue
          element :save_and_continue_button, :submit_text, 'helpers.submit.update', exact: false
        end
        
        def set_for(user)
          group_claims_csv = user[0].dig(:group_claims_csv)
          if group_claims_csv.present?
            full_path = File.absolute_path(File.join('..', '..', 'fixtures', group_claims_csv), __dir__)
            main_content.group_claims.set('Yes')
            main_content.group_claims.file_upload.set(full_path)
          else
            main_content.group_claims.set('No')
          end
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end
      end
    end
  end
end

require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class GroupClaimsUploadPage < BasePage
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
          element :save_and_continue_button, 'form.edit_additional_claimants_upload input[value="Save and continue"]'

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

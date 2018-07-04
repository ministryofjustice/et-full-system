require_relative './base_page'
module EtFullSystem
  module Test
    module Et3
      class AdditionalInformationPage < BasePage
        set_url '/respond/additional_information'
        section :content_body, '.content-body' do
          section :upload_additional_information_question, :css, '#upload-additional-file .dz-default' do
            section :file_button, :css, 'button[type=button]' do
              def set(value)
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
                ensure_file_input_visible
                file_button.set(value)
              end

              private
              def ensure_file_input_visible
                return if root_element[:open]
                  root_element.click
              end

              element :continue_button, :button, "Save and continue"
            end
          end
        end

        def next
          continue_button.click
        end

        def set_for(claim)
          data = claim.to_h
          return if claim.nil?
          if data.key?(:rtf_file)
            full_path = File.expand_path(File.join('test_common', 'fixtures', data[:rtf_file]))
            content_body.upload_additional_information_question.file_button.set(full_path)
          end
        end
      end
    end
  end
end

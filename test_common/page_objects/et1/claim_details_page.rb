require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimDetailsPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          element :description, 'textarea[name="claim_details[claim_details]"]'
          section :similar_claims, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Similar claims")]] }) do
            section :other_claimants, '.claim_details_other_known_claimants' do
              def set(value)
                choose value, name: "claim_details[other_known_claimants]"
              end
            end
            element :names, 'textarea[name="claim_details[other_known_claimant_names]"]'
          end

          section :rtf_file, :xpath, (XPath.generate { |x| x.descendant(:details)[x.child(:summary)[x.string.n.is('Or upload it as a separate document')]] }) do
            section :file_input, :css, 'input[type=file]' do
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
              file_input.set(value)
            end

            private

            def ensure_file_input_visible
              return if root_element[:open]
              root_element.click
            end
          end

          element :save_and_continue_button, 'form.edit_claim_details input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(claim)
          data = claim.to_h
          return if claim.nil?
          if data.key?(:rtf_file)
            full_path = File.absolute_path(File.join('..', '..', 'fixtures', data[:rtf_file]), __dir__)
            main_content.rtf_file.set(full_path)
          end
          set_field main_content, :description, data
          set_field main_content.similar_claims, :other_claimants, data
          main_content.similar_claims.names.set data[:other_claimant_names] if data.key?(:other_claimant_names)
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end

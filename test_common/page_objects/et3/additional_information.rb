require_relative './base_page'
module EtFullSystem
  module Test
    module Et3
      class AdditionalInformationPage < BasePage
        set_url '/respond/additional_information'
        element :error_header, :error_titled, 'errors.header', exact: true
        section :upload_additional_information_question, :css, 'form.dropzone' do
          include ::EtFullSystem::Test::I18n
          element :upload_select, :select_button, 'questions.upload_additional_information.button'
          element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
          element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false
          delegate :set, to: :upload_select
        end
        element :continue_button, :button, "Save and continue"

        def next
          continue_button.click
        end

        def attach_additional_information_file(respondent)
          data = respondent.to_h
          return if respondent.nil?
          if data.key?(:rtf_file)
            page.execute_script <<-JS
              fakeFileInput = window.$('<input/>').attr(
                {id: 'fakeFileInput', type:'file'}
              ).appendTo('body');
            JS
            attach_file("fakeFileInput", File.expand_path(File.join('test_common', 'fixtures', data[:rtf_file])))
            page.execute_script("var fileList = [fakeFileInput.get(0).files[0]]")
            page.execute_script <<-JS
              var e = jQuery.Event('drop', { dataTransfer : { files : [fakeFileInput.get(0).files[0]] } });
              $('.dropzone')[0].dropzone.listeners[0].events.drop(e);
            JS
          end
        end
      end
    end
  end
end
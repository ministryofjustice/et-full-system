require_relative './base_page'
require_relative '../../../test_common/helpers/upload_helper'
module EtFullSystem
  module Test
    module Et3
      class AdditionalInformationPage < BasePage
        include ::EtFullSystem::Test::UploadHelper
        include RSpec::Matchers
        set_url '/respond/additional_information'
        section :switch_language, '.switch-language' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end
        element :header, :content_header, "additional_information.header"
        section :main_header, '.content-header' do

        end
        element :error_header, :error_titled, 'errors.header', exact: true
        section :upload_additional_information_question, :css, 'form.dropzone' do
          include ::EtFullSystem::Test::I18n
          element :upload_select, :select_button, 'questions.upload_additional_information.button'
          element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
          element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false
          def set(*args); upload_select.set(*args); end
        end
        # Save and continue
        element :continue_button, :submit_text, 'components.save_and_continue_button'
        def next
          continue_button.click
        end

        def switch_to_welsh
          switch_language.welsh_link.click
        end
  
        def switch_to_english
          switch_language.english_link.click
        end

        def attach_additional_information_file(respondent)
          data = respondent.to_h
          return if respondent.nil?
          if data.key?(:rtf_file)
            force_remote do
              page.attach_file nil, File.expand_path(File.join('test_common', 'fixtures', data[:rtf_file])) do
                page.click_button t('questions.upload_additional_information.button')
              end
            end
          end
          sleep 2
          page.has_content?('Remove file')
        end
      end
    end
  end
end

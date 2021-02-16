require_relative './base_page'
module EtFullSystem
  module Test
    module Et3
      class SavingResponsePage < BasePage
        include RSpec::Matchers
        #page and main header
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'saving_response.header'
        end
        section :main_content, '#content .main-section .main-content' do
          element :response_number_text, :paragraph, 'saving_response.application_number'
          element :response_number, '.reference-number'
          element :claims_intro_text, :paragraph, 'saving_response.intro_text'
          #email address
          section :email_label, :question_labelled, 'saving_response.email_label', exact: false do
            element :field, :css, "input"
            def set(*args); field.set(*args); end
          end
          #create your memorable word
          section :memorable_word_label, :question_labelled, 'saving_response.memorable_word_label', exact: false do
            element :field, :css, "input"
            def set(*args); field.set(*args); end
          end
          element :example_word, :paragraph, 'simple_form.hints.application_number.password'
          #print this page
          element :print_link, :link_named, 'saving_response.print_link'
          element :print_copy, :paragraph, 'saving_response.print_copy', exact: false
          #save and continue button
          element :save_and_continue, :submit_text, 'helpers.submit.update'
        end

        def save_and_continue
          page.scroll_to(main_content.save_and_continue, align: :bottom)
          main_content.save_and_continue.click
        end

        def set
          main_content.email_label.set("example@example.com")
          main_content.memorable_word_label.set("password")
        end
      end
    end
  end
end

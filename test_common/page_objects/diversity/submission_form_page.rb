require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class SubmissionFormPage < BasePage
        section :main_content, '#main-content' do
          section :claim_type, :xpath, (XPath.generate { |x| x.attr(:class).contains('legend') && x.descendant(:div)[x.descendant(:h2)[x.string.n.is("What your claim is about")]] }) do
            def set(value)
              check value
            end
          end
        end

        def submit_form
          main_content.submit_form.click
        end
      end
    end
  end
end
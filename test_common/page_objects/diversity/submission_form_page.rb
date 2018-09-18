require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class SubmissionFormPage < BasePage
        section :main_content, '.main-content' do
          section :form_fields, '.form-fields' do
            section :claim_type, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('What is the type of your claim?')]]} do
              element :link, 'td a'
            end
            section :sex, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('What is your sex?')]]} do
              element :link, 'td a'
            end
            section :gender, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('What is your gender identity?')]]} do
              element :link, 'td a'
            end
            section :gender_at_birth, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('Is your gender identity different to the sex you were assumed to be at birth?')]]} do
              element :link, 'td a'
            end
            section :sexual_identity, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('Which of the options below best describes your sexual identity?')]]} do
              element :link, 'td a'
            end
            section :relationship, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('What is your relationship status?')]]} do
              element :link, 'td a'
            end
            section :age_group, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('Which age group are you in?')]]} do
              element :link, 'td a'
            end
            section :caring_responsibility, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('Do you have any caring responsibilities?')]]} do
              element :link, 'td a'
            end
            section :religion, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('What is your religion?')]]} do
              element :link, 'td a'
            end
            section :ethnic_group, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('What is your ethnic group?')]]} do
              element :link, 'td a'
            end
            section :disability, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('Do you have any physical or mental health conditions or illnesses lasting or expected to last for 12 months or more?')]]} do
              element :link, 'td a'
            end
            section :pregnant, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('Were you pregnant when you were dismissed?')]]} do
              element :link, 'td a'
            end
          end
          element :submit_form, 'input[value="Submit Form"]'
        end

        def submit_form
          main_content.submit_form.click
        end
      end
    end
  end
end
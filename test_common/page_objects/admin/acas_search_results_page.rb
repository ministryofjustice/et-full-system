require 'rspec/matchers'
module EtFullSystem
  module Test
    module Admin
      class AcasSearchResultsPage < Admin::BasePage
        include ::RSpec::Matchers
        section :search_fieldset, :fieldset, 'ACAS Search' do
          element :search_field, :fillable_field, 'Please enter your ACAS Early Conciliation Certificate number*'
        end

        element :search_button, 'fieldset.actions input[value=Search]'
        section :search_results, '.search-results' do
          section :respondent_section, :xpath, XPath.generate {|x| x.descendant(:div)[x.child(:h3)[x.string.n.is('Respondent')]]} do
            section :acas_first_contact, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('ACAS first contact')]]} do
              element :value_element, 'td'
            end
            section :acas_conciliation_closed, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('ACAS conciliation closed')]]} do
              element :value_element, 'td'
            end
            section :difference, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('Difference')]]} do
              element :value_element, 'td'
            end
            section :certificate_sent, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('Certificate sent')]]} do
              element :value_element, 'td'
            end
            section :full_name, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('Full name')]]} do
              element :value_element, 'td'
            end
          end
          section :lead_claimant_section, :xpath, XPath.generate {|x| x.descendant(:div)[x.child(:h3)[x.string.n.is('Lead Claimant')]]} do
            section :full_name, :xpath, XPath.generate {|x| x.descendant(:tr)[x.child(:th)[x.string.n.is('Full name')]]} do
              element :value_element, 'td'
            end
          end
        end

        def search(value)
          search_fieldset.search_field.set(value)
          search_button.click
        end

        def has_valid_certificate?
          aggregate_failures 'validating content' do
            expect(search_results.respondent_section.acas_first_contact.value_element).to have_content('01/01/2017 12:00:00')
            expect(search_results.respondent_section.acas_conciliation_closed.value_element).to have_content('01/12/2017 12:00:00')
            expect(search_results.respondent_section.difference.value_element).to have_content('334 days')
            expect(search_results.respondent_section.certificate_sent.value_element).to have_content('Email')
            expect(search_results.respondent_section.full_name.value_element).to have_content('Respondent Name')
            expect(search_results.lead_claimant_section.full_name).to have_content('Claimant Name')
          end
          true
        end
      end
    end
  end
end

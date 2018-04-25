require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class GroupClaimsPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          section :group_claims, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("People making a claim with you")]] }) do
            def set(value)
              choose(value, name: "additional_claimants[of_collection_type]")
            end
            element :upload_link, :link, "upload their details in a separate spreadsheet"

            (2..6).each_with_index do |number, idx|

              section :"about_claimant_#{number}", :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Claimant #{idx + 2}")]] }) do
                section :title, "select[name=\"additional_claimants[collection_attributes][#{idx}][title]\"]" do
                  def set(value)
                    root_element.select(value)
                  end
                end
                element :first_name, "input[name=\"additional_claimants[collection_attributes][#{idx}][first_name]\"]"
                element :last_name, "input[name=\"additional_claimants[collection_attributes][#{idx}][last_name]\"]"
                section :date_of_birth, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Date of birth")]] }) do
                  element :day, "input[name=\"additional_claimants[collection_attributes][#{idx}][date_of_birth][day]\"]"
                  element :month, "input[name=\"additional_claimants[collection_attributes][#{idx}][date_of_birth][month]\"]"
                  element :year, "input[name=\"additional_claimants[collection_attributes][#{idx}][date_of_birth][year]\"]"
                  def set(value)
                    (day_value, month_value, year_value) = value.split("/")
                    day.set(day_value)
                    month.set(month_value)
                    year.set(year_value)
                  end
                end
                element :building, "input[name=\"additional_claimants[collection_attributes][#{idx}][address_building]\"]"
                element :street, "input[name=\"additional_claimants[collection_attributes][#{idx}][address_street]\"]"
                element :locality, "input[name=\"additional_claimants[collection_attributes][#{idx}][address_locality]\"]"
                element :county, "input[name=\"additional_claimants[collection_attributes][#{idx}][address_county]\"]"
                element :post_code, "input[name=\"additional_claimants[collection_attributes][#{idx}][address_post_code]\"]"

              end
            end
            element :add_more_claimants_link, 'input[value="Add more claimants"]'
          end
          element :save_and_continue_button, 'form.edit_additional_claimants input[value="Save and continue"]'

        end

        def set_for(user)
          group_claims_data = user.dig(:personal, :group_claims) || []
          group_claims_csv = user.dig(:personal, :group_claims_csv)
          if group_claims_data.present? || group_claims_csv.present?
            main_content.group_claims.set('Yes')
            group_claims_data.each.with_index do |claim, idx|
              add_more_claimants unless idx == 0
              populate_group_claim_section(claim, idx + 2)
            end
            main_content.group_claims.upload_link.click if group_claims_csv.present?
          else
            main_content.group_claims.set('No')
          end
        end

        def add_more_claimants
          main_content.group_claims.add_more_claimants_link.click
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        private

        def upload_page
          GroupClaimsUploadPage.new
        end

        def populate_group_claim_section(claimant_data, claimant_number)
          s = main_content.group_claims.send(:"about_claimant_#{claimant_number}")
          set_field s, :title, claimant_data
          set_field s, :first_name, claimant_data
          set_field s, :last_name, claimant_data
          set_field s, :date_of_birth, claimant_data
          set_field s, :building, claimant_data
          set_field s, :street, claimant_data
          set_field s, :locality, claimant_data
          set_field s, :county, claimant_data
          set_field s, :post_code, claimant_data
        end

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end

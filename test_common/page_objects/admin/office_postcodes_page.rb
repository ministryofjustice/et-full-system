module EtFullSystem
  module Test
    module Admin
      class OfficePostcodesPage < Admin::BasePage
        element :new_office_postcode, '#titlebar_right .action_item'
        section :main_content, '#main_content .paginated_collection .paginated_collection_contents' do
          section :tbody, 'tbody' do
            element :postcode, '.col.col-postcode'
            element :office, '.col.col-office'
            section :action_table, '.col.col-actions .table_actions' do
              element :view, '.view_link.member_link'
              element :edit, '.edit_link.member_link'
              element :delete, '.delete_link.member_link'
            end
          end
        end
        element :filter_by_office_id, 'select[id="q_office_id"]'
        element :filter_by_postcode_id, 'input[id="q_postcode"]'
        element :filter_button, 'input[type="submit"]'

        def filter_by_office(office_name)
          filter_by_office_id.select(office_name)
        end

        def filter_by_postcode(postcode)
          filter_by_postcode_id.set(postcode)
        end

        def filter_search
          filter_button.click
        end

        def add_new_office_postcode
          new_office_postcode.click
        end

        def office_delete
          main_content.tbody.action_table.delete.click
          page.driver.browser.switch_to.alert.accept
        end
      end
    end
  end
end

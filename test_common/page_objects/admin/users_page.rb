require_relative '../../../test_common/helpers/upload_helper'
require 'rspec/matchers'
require 'csv'
module EtFullSystem
  module Test
    module Admin
      class UsersPage < Admin::BasePage
        include ::EtFullSystem::Test::UploadHelper
        include ::RSpec::Matchers
        section :title_bar, '#title_bar' do
          section :title_bar, '#titlebar_right' do
            element :new_user, :link, 'New User'
            element :import_users, :link, 'Import Users'
          end
        end
        section :collection_contents, '.index_content .index_as_table' do
          section :thead, 'thead tr' do
            element :resource_selection_cell, '.col.col-selectable .resource_selection_toggle_cell'
            element :resource_id_link, '.col.col-id a'
            element :username, '.col.col-username a'
            element :email, '.col.col-email a'
            element :department, '.col.col-department a'
          end
          section :table, '#index_table_users tbody' do
            def has_user_matching?(user)
              root_element.has_selector?(:css, '.col.col-username', text: user['username'])
            end
            sections :tr, 'tr' do
              elements :resource_selection_cell, '.col.col-selectable .resource_selection_cell input[type="checkbox"]'
              elements :resource_id_link, '.col.col-id resource_id_link'
              elements :username, '.col.col-username'
              elements :email, '.col.col-email'
              elements :department, '.col.col-department'
              section :table_actions, '.col.col-actions .table_actions' do
                elements :view, '.view_link.member_link'
                elements :edit, '.edit_link.member_link'
                elements :delete, '.delete_link.member_link'
              end
            end
          end
        end
        section :filters_contents, '.panel_contents #new_q' do
          section :email_section, '#q_email_input' do
            element :filter_by_email, 'select.select2-hidden-accessible'
            element :email_input, '#q_email'
          end
          element :filter_button, '.buttons input[type="submit"]'
        end

        def click_import_users
          title_bar.title_bar.import_users.click
        end

        def search_by_email(filter_by, email_address, users)
          filters_contents.email_section.filter_by_email.select(filter_by)
          filters_contents.email_section.email_input.set(email_address)
          filters_contents.filter_button.click
          assert_users_are_imported(users)
        end

        def assert_users_are_imported(users)
          users_csv = users.dig(:users_file)
          filename = File.expand_path(File.join('test_common', 'fixtures', users_csv))
          aggregate_failures 'Validating all users are imported' do
            CSV.foreach(filename, :headers => true) do |csv_row|
              expect(collection_contents.table).to have_user_matching(csv_row)
            end
          end
        end
      end
    end
  end
end

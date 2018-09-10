module EtFullSystem
  module Test
    module Admin
      class UsersPage < Admin::BasePage
        section :title_bar, '#title_bar' do
          section :title_bar, '#titlebar_right' do
            element :new_user, :link, 'New User'
            element :import_users, :link, 'Import Users'
          end
        end

        def click_import_users
          title_bar.title_bar.import_users.click
        end
      end
    end
  end
end

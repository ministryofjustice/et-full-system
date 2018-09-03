module EtFullSystem
  module Test
    module Admin
      class BasePage < ::EtFullSystem::Test::BasePage
        section :menu, '#header ul#tabs' do
          element :office_postcodes_menu_item, :link, 'Office Post Codes'
          element :acas_menu_item, :link, 'Acas'
          element :acas_certificates_menu_item, :link, 'Certificate Search'
          def choose_acas_certificates
            acas_menu_item.hover
            acas_certificates_menu_item.click
          end

          def click_office_postcodes
            office_postcodes_menu_item.click
          end
        end
        def self.base_url
          Configuration.admin_url
        end

        def self.set_url(url, *args)
          super("#{base_url}#{url}", *args)
        end
      end
    end
  end
end

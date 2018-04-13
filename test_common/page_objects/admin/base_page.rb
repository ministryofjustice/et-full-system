module EtFullSystem
  module Test
    module Admin
      class BasePage < ::EtFullSystem::Test::BasePage
        def self.base_url
          ENV.fetch('ADMIN_BASE_URL')
        end

        def self.set_url(url, *args)
          super("#{base_url}#{url}", *args)
        end

      end
    end
  end
end
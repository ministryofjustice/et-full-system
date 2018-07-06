module EtFullSystem
  module Test
    module Diversity
      class BasePage < ::EtFullSystem::Test::BasePage
        def self.base_url
          Configuration.diversity_url
        end

        def self.set_url(url, *args)
          super("#{base_url}#{url}", *args)
        end
      end
    end
  end
end
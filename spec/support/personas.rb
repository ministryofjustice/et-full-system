module EtFullSystem
  module Test
    module PersonasHelper

      # @return [EtFullSystem::Test::PersonasRepository]
      def personas
        @personas ||= ::EtFullSystem::Test::PersonasRepository.new
      end
    end
  end
end

RSpec.configure do |c|
  c.include ::EtFullSystem::Test::PersonasHelper
end

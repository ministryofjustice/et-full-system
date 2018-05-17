require_relative '../../systems/et3/test_common/page_objects'
require_relative '../../systems/et3/test_common/helpers'
require_relative '../../systems/et3/test_common/personas'
require 'faker'
module EtFullSystem
  module Test
    module ET3
      class Helper
        include ::ET3::Test::Setup
        include ::ET3::Test::Pages
        attr_accessor :user
        def personas
          @personas ||= ::ET3::Test::PersonasRepository.new
        end



      end

      def et3_helper
        Thread.current['et3_helper'] ||= Helper.new
      end
    end
  end
end
include EtFullSystem::Test::ET3

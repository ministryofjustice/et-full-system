require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class DiversityMonitoringPage < BasePage
        section :main_content, '#content .container .main-content' do
          section :coam, 'select[name="diversity[claim_type]"]' do
            def set(value)
              root_element.select(value)
            end
          end
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end
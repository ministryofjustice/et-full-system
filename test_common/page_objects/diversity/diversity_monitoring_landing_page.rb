require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class DiversityMonitoringLandingPage < BasePage
        element :heading, '.main-header h1'
        section :main_content, '#content .main-section .main-content' do
          element :start_diversity, 'a[href="/apply/diversity/new"]'
        end

        def start_diversity
          main_content.start_diversity.click
        end
      end
    end
  end
end
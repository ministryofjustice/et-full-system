require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class DiversityMonitoringLandingPage < BasePage
        section :main_content, '#content .container' do
          element :heading, '.main-header h1'
          section :content_section, '.main-section .main-content' do
            element :start_diversity, 'a[href="/apply/diversity/new"]'
          end
        end

        def start_diversity
          main_content.content_section.start_diversity.click
        end
      end
    end
  end
end
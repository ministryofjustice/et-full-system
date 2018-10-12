require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class GuidePage < BasePage
        include RSpec::Matchers
        set_url ::EtFullSystem::Test::Configuration.et1_url
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        section :static_content, '.main-content .static-content' do
          section :time_limits, '#time_limits' do
            #Time limits
            element :time_limits_title, :content_header, 'guides.time_limits.title'
            element :line_one, :paragraph, 'guides.time_limits.line_one'
            element :list_one, :listing_containing_text, 'guides.time_limits.list.one'
            element :list_two, :listing_containing_text, 'guides.time_limits.list.two'
            element :line_two_html, :paragraph, 'guides.time_limits.line_two_html'
            element :line_three, :paragraph, 'guides.time_limits.line_three'
          end
        end
        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
        end

        def switch_to_welsh
          feedback_notice.welsh_link.click
        end

        def switch_to_english
          feedback_notice.english_link.click
        end

        def has_correct_translation_for_time_limits?
          expect(static_content.time_limits.time_limits_title.text).to be_truthy
          expect(static_content.time_limits.line_one.text).to be_truthy
          expect(static_content.time_limits.list_one.text).to be_truthy
          expect(static_content.time_limits.list_two.text).to be_truthy
          expect(static_content.time_limits.line_two_html.text).to be_truthy
          expect(static_content.time_limits.line_three.text).to be_truthy
        end
      end
    end
  end
end
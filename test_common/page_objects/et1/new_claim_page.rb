require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class NewClaimPage < BasePage
        set_url ::EtFullSystem::Test::Configuration.et1_url
        section :feedback_notice, '.feedback-notice' do
          element :switch_language, :link_named, 'switch.language'
          element :feedback_link, :paragraph_link_named, 'shared.feedback_link.feedback_statement_html'
        end
        element :header, :headertext, 'new.header', exact: false
        element :are_you_in_time_h2, :h2header, 'claims.news.are_you_in_time.legend', exact: false
        element :are_you_in_time_body, :h2bodytext, 'claims.news.are_you_in_time.body_html', exact: false
        element :have_you_contacted_acas_h2, :h2header, 'claims.news.have_you_contacted_acas.legend', exact: false
        element :have_you_contacted_acas_body, :h2bodytext, 'claims.news.have_you_contacted_acas.body_html', exact: false
        element :start_a_claim_link, 'input[type="submit"]', exact: false
        def start_a_claim
          start_a_claim_link.click
        end
      end
    end
  end
end
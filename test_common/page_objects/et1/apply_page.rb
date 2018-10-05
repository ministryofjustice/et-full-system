# require_relative './base_page'
# module EtFullSystem
#   module Test
#     module Et1
#       class ApplyPage < BasePage
#         set_url '/apply'
#         element :feedback_link, :textarea, 'shared.feedback_link.feedback_statement_html'
#         section :switch_language, :href_link, 'switch' do
#           delegate :set, to: :root_element, 
#         end
#         def set_for(data)
#         end
#         element :header, :headertext, 'new.header'
#         element :are_you_in_time_h2, :h2text, 'are_you_in_time.legend'
#         element :are_you_in_time_body :textarea, 'are_you_in_time.body_html'
#         element :have_you_contacted_acas_h2, :h2text, 'have_you_contacted_acas.legend'
#         element :have_you_contacted_acas_body :textarea, 'have_you_contacted_acas.body_html'
#     end
#   end
# end
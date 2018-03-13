module EtFullSystem
  module Test
    module Et1ClaimHelper
      def start_a_new_et1_claim
        et1_new_claim_page.load
        et1_new_claim_page.start_a_claim
      end
    end
  end
end

RSpec.configure do |c|
  c.include EtFullSystem::Test::Et1ClaimHelper, type: :feature
end
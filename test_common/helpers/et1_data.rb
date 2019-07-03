# def match_et1_data_for(expected)
#   EtFullSystem::Test::Et1Data.new(expected)
# end

# module EtFullSystem
#   module Test
#     module Et1Data
#       def initialize(claim:, claimants:, representative:, respondents:, employment:)
#         self.claim = claim
#         self.claimants = claimants
#         self.representative = representative
#         self.respondents = respondents
#         self.employment = employment
#       end

#       def matches?(actual)
#         self.page_object = EtFullSystem::Test::FileObjects::Et1CcdFile.new(actual)
#         page_object.has_correct_contents_for?(claim: claim, claimants: claimants, respondents: respondents, representative: representative, employment: employment)
#       end

#       private

#       attr_accessor :page_object, :claimants, :respondents, :representative, :employment, :claim
#     end
#   end
# end

def match_et1_pdf_for(expected)
  EtFullSystem::Test::MatchEt1PdfFor.new(expected)
end

module EtFullSystem
  module Test
    class MatchEt1PdfFor
      def initialize(claim:, claimants:, representative:, respondents:, employment:)
        self.claim = claim
        self.claimants = claimants
        self.representative = representative
        self.respondents = respondents
        self.employment = employment
        self.mismatches = []
      end

      # @param [File] actual The pdf file to test
      def matches?(actual)
        self.page_object = EtFullSystem::Test::FileObjects::Et1PdfFile.new(actual)
        page_object.has_correct_contents_for?(claim: claim, claimants: claimants, respondents: respondents, representative: representative, employment: employment, errors: mismatches, indent: 1)
      end

      def failure_message
        "The data provided did not match the ET1 PDF - here are the details: \n\n#{mismatches.join("\n")}"
      end

      private

      attr_accessor :mismatches, :page_object, :claimants, :respondents, :representative, :employment, :claim
    end
  end
end

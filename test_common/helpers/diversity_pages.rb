module EtFullSystem
  module Test
    module DiversityPages
      def self.diversity_landing_page
        Diversity::DiversityMonitoringLandingPage.new
      end
      def self.claim_type_page
        Diversity::ClaimTypePage.new
      end
      
      def self.gender_page
        Diversity::GenderPage.new
      end

      def self.gender_at_birth_page
        Diversity::GenderAtBirthPage.new
      end

      def self.sexual_identity_page
        Diversity::SexualIdentityPage.new
      end

      def self.relationship_status_page
        Diversity::RelationshipStatusPage.new
      end

      def self.age_group_page
        Diversity::AgeGroupPage.new
      end

      def self.responsibilites_page
        Diversity::ResponsibiltiesPage.new
      end

      def self.religion_page
        Diversity::ReligionPage.new
      end
      
      def self.ethnic_group_page
        Diversity::EthnicGroupPage.new
      end

      def self.health_page
        Diversity::HealthPage.new
      end

      def self.pregnancy_page
        Diversity::PregnancyPage.new
      end
    end
  end
end

require 'rspec/matchers'
require 'pdf-forms'
require_relative './base_pdf_file'
require_relative './et1_pdf_file/base.rb'
Dir.glob(File.absolute_path('./et1_pdf_file/**/*.rb', __dir__)).each { |f| require f }

module EtFullSystem
  module Test
    module FileObjects
      # Represents the ET3 PDF file and provides assistance in validating its contents
      class Et1PdfFile < BasePdfFile # rubocop:disable Metrics/ClassLength

        include RSpec::Matchers
        
        def initialize(*args, locale:)
          super(*args)
          self.locale = locale
        end

        def initialize(*args, template:)
          super(*args)
          self.template = template
        end

        def has_correct_contents_for?(claim: , claimants:, respondents:, representative:, employment:)
          Et1PdfFileSection::YourDetailsSection.new(tempfile, template: template).has_contents_for?(claimant: claimants.first)
          Et1PdfFileSection::RespondentsDetailsSection.new(tempfile, template: template).has_contents_for?(respondents: respondents)
          Et1PdfFileSection::MultipleCasesSection.new(tempfile, template: template).has_contents_for?(claim: claim)
          Et1PdfFileSection::NotYourEmployerSection.new(tempfile, template: template).has_contents_for?
          Et1PdfFileSection::EmploymentDetailsSection.new(tempfile, template: template).has_contents_for?(employment: employment)
          Et1PdfFileSection::EarningsAndBenefitsSection.new(tempfile, template: template).has_contents_for?(employment: employment)
          Et1PdfFileSection::WhatHappenedSinceSection.new(tempfile, template: template).has_contents_for?(employment: employment)
          Et1PdfFileSection::TypeAndDetailsSection.new(tempfile, template: template).has_contents_for?(claim: claim)
          Et1PdfFileSection::WhatDoYouWantSection.new(tempfile, template: template).has_contents_for?(claim: claim)
          Et1PdfFileSection::InformationToRegulatorsSection.new(tempfile, template: template).has_contents_for?(claim: claim)
          Et1PdfFileSection::YourRepresentativeSection.new(tempfile, template: template).has_contents_for?(representative: representative)
          Et1PdfFileSection::DisabilitySection.new(tempfile, template: template).has_contents_for?(claimant: claimants.first)
          Et1PdfFileSection::AdditionalRespondentsSection.new(tempfile, template: template).has_contents_for?(respondents: respondents)
          Et1PdfFileSection::FinalCheckSection.new(tempfile, template: template).has_contents_for?
          Et1PdfFileSection::AdditionalInformationSection.new(tempfile, template: template).has_contents_for?(claim: claim)
          true
        end
        private

        attr_accessor :template
      end
    end
  end
end

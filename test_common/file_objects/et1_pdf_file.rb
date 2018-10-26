require 'rspec/matchers'
require 'pdf-forms'
require_relative './base_pdf_file'
Dir.glob(File.absolute_path('./et1_pdf_file/**/*.rb', __dir__)).each { |f| require f }

module EtFullSystem
  module Test
    module FileObjects
      # Represents the ET3 PDF file and provides assistance in validating its contents
      class Et1PdfFile < BasePdfFile # rubocop:disable Metrics/ClassLength
        def has_correct_contents_for?(claim: , claimants:, respondents:, representative:, employment:, errors: [], indent: 1)
          Et1PdfFileSection::YourDetailsSection.new(tempfile).has_contents_for?(claimant: claimants.first, errors: errors, indent: indent + 1)
          Et1PdfFileSection::RespondentsDetailsSection.new(tempfile).has_contents_for?(respondents: respondents, errors: errors, indent: indent + 1)
          Et1PdfFileSection::MultipleCasesSection.new(tempfile).has_contents_for?(claim: claim, errors: errors, indent: indent + 1)
          Et1PdfFileSection::NotYourEmployerSection.new(tempfile).has_contents_for?(errors: errors, indent: indent + 1)
          Et1PdfFileSection::EmploymentDetailsSection.new(tempfile).has_contents_for?(employment: employment, errors: errors, indent: indent + 1)
          Et1PdfFileSection::EarningsAndBenefitsSection.new(tempfile).has_contents_for?(employment: employment, errors: errors, indent: indent + 1)
          Et1PdfFileSection::WhatHappenedSinceSection.new(tempfile).has_contents_for?(errors: errors, indent: indent + 1)
          Et1PdfFileSection::TypeAndDetailsSection.new(tempfile).has_contents_for?(claim: claim, errors: errors, indent: indent + 1)
          Et1PdfFileSection::WhatDoYouWantSection.new(tempfile).has_contents_for?(claim: claim, errors: errors, indent: indent + 1)
          Et1PdfFileSection::InformationToRegulatorsSection.new(tempfile).has_contents_for?(claim: claim, errors: errors, indent: indent + 1)
          Et1PdfFileSection::YourRepresentativeSection.new(tempfile).has_contents_for?(representative: representative, errors: errors, indent: indent + 1)
          Et1PdfFileSection::DisabilitySection.new(tempfile).has_contents_for?(claimant: claimants.first, errors: errors, indent: indent + 1)
          Et1PdfFileSection::AdditionalRespondentsDetailsSection.new(tempfile).has_contents_for?(respondents: respondents, errors: errors, indent: indent + 1)
          Et1PdfFileSection::FinalCheckSection.new(tempfile).has_contents_for?(errors: errors, indent: indent + 1)
          Et1PdfFileSection::AdditionalInfoSection.new(tempfile).has_contents_for?(claim: claim, errors: errors, indent: indent + 1)
          errors.empty?
        end
      end
    end
  end
end

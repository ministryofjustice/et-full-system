module EtFullSystem
  module Test
    class AdditionalRespondentSection < BaseSection
      include EtTestHelpers::Section
      #Respondent 2
      element :blank_name, :error, 'activemodel.errors.models.additional_respondents_form/additional_respondent.attributes.name.blank'
      section :name, :question_labelled, 'simple_form.labels.respondent.name' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      element :blank_building, :error, 'activemodel.errors.models.additional_respondents_form/additional_respondent.attributes.address_building.blank'
      section :building, :question_labelled, 'simple_form.labels.respondent.address_building' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      element :blank_street, :error, 'activemodel.errors.models.additional_respondents_form/additional_respondent.attributes.address_building.blank'
      section :street, :question_labelled, 'simple_form.labels.respondent.address_street' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      element :blank_locality, :error, 'activemodel.errors.models.additional_respondents_form/additional_respondent.attributes.address_street.blank'
      section :locality, :question_labelled, 'simple_form.labels.respondent.address_locality' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      element :blank_county, :error, 'activemodel.errors.models.additional_respondents_form/additional_respondent.attributes.address_locality.blank'
      element :county_hint, :paragraph, 'simple_form.hints.respondent.address_county', exact: false
      section :county, :question_labelled, 'simple_form.labels.respondent.address_county' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      element :blank_post_code, :error, 'activemodel.errors.models.additional_respondents_form/additional_respondent.attributes.address_post_code.blank'
      element :invalid_post_code, :error, 'activemodel.errors.models.additional_respondents_form/additional_respondent.attributes.address_post_code.invalid'
      section :post_code, :question_labelled, 'simple_form.labels.respondent.address_post_code' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      #Acas number
      element :invalid_acas_number, :error, 'activemodel.errors.models.additional_respondents_form/additional_respondent.attributes.acas_early_conciliation_certificate_number.invalid'
      element :blank_acas_number, :error, 'activemodel.errors.models.additional_respondents_form/additional_respondent.attributes.acas_early_conciliation_certificate_number.blank'
      gds_text_input :acas_number, :'simple_form.labels.respondent.acas_early_conciliation_certificate_number'
      #I don't have an Acas number
      # @!method no_acas_number
          #   A govuk radio button component for no_acas_number question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
      gds_radios :no_acas_number, :'simple_form.labels.respondent.no_acas_number'
      gds_radios :respondent_no_acas_number_reason, :'claims.additional_respondents.no_acas_number_reason'
    end
  end
end

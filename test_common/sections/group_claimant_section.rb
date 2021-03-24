module EtFullSystem
  module Test
    class GroupClaimantSection < BaseSection
      include EtTestHelpers::Section
      section :title, :question_labelled, 'simple_form.labels.claimant.title', exact: false do
        element :blank_title, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.title.inclusion', exact: false
        include ::EtFullSystem::Test::I18n
        def set(value)
          root_element.select(factory_translate(value))
        end
      end
      #first name
      section :first_name, :question_labelled, 'simple_form.labels.claimant.first_name' do
        element :blank_first_name, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.first_name.blank'
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      #lastname name
      section :last_name, :question_labelled, 'simple_form.labels.claimant.last_name' do
        element :blank_last_name, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.last_name.blank'
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      #Date of birth
      element :date_of_birth_labelled, :legend_header, 'claims.personal_details.date_of_birth'
      element :date_of_birth_hint, :paragraph, 'simple_form.hints.claimant.date_of_birth'
      element :blank_date_of_birth, :error, 'activemodel.errors.models.claimant.attributes.date_of_birth.too_young'
      element :invalid_date_of_birth, :error, 'activemodel.errors.models.claimant.attributes.date_of_birth.invalid'
      # @!method date_of_birth
      #   A govuk date field component wrapping the inputs, label, hint etc.. for the date of birth question
      #   @return [EtTestHelpers::Components::GovUKDateField] The site prism section
      section :date_of_birth, govuk_component(:date_field), :govuk_date_field, :'claims.personal_details.date_of_birth'
      #Building number or name
      element :blank_building, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.address_building.blank'
      section :building, :question_labelled, 'simple_form.labels.claimant.address_building' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      #Street
      element :blank_street, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.address_street.blank'
      section :street, :question_labelled, 'simple_form.labels.claimant.address_street' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      #Town/city
      element :blank_locality, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.address_locality.blank'
      section :locality, :question_labelled, 'simple_form.labels.claimant.address_locality' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      #County
      element :blank_county, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.address_county.blank'
      section :county, :question_labelled, 'simple_form.labels.claimant.address_county' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end
      #Postcode
      element :blank_post_code, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.address_post_code.blank'
      element :invalid_post_code, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.address_post_code.invalid'
      section :post_code, :question_labelled, 'simple_form.labels.claimant.address_post_code' do
        element :field, :css, 'input'
        def set(*args); field.set(*args); end
      end

    end

  end
end

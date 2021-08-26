module EtFullSystem
  module Test
    class GroupClaimantSection < BaseSection
      include EtTestHelpers::Section
      section :title, :question_labelled, 'simple_form.labels.claimant.title.label', exact: false do
        element :blank_title, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.title.inclusion', exact: false
        include ::EtFullSystem::Test::I18n
        def set(value)
          root_element.select(factory_translate(value))
        end
      end
      #first name
      # @!method first_name
      #   A govuk text field component wrapping the input, label, hint etc..
      #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
      section :first_name, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.first_name'

      #lastname name
      # @!method last_name
      #   A govuk text field component wrapping the input, label, hint etc..
      #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
      section :last_name, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.last_name'

      #Date of birth
      # @!method date_of_birth
      #   A govuk date field component wrapping the inputs, label, hint etc.. for a date question
      #   @return [EtTestHelpers::Components::GovUKDateField] The site prism section
      section :date_of_birth, govuk_component(:date_field), :govuk_date_field, :'claims.personal_details.date_of_birth'
      # @!method date_of_birth
      #   A govuk date field component wrapping the inputs, label, hint etc.. for the date of birth question
      #   @return [EtTestHelpers::Components::GovUKDateField] The site prism section
      section :date_of_birth, govuk_component(:date_field), :govuk_date_field, :'claims.personal_details.date_of_birth'
      # Building number or name
      # @!method building
      #   A govuk text field component wrapping the input, label, hint etc..
      #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
      section :building, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.address_building'


      # Street
      # @!method street
      #   A govuk text field component wrapping the input, label, hint etc..
      #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
      section :street, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.address_street'
      # Town/city
      # @!method locality
      #   A govuk text field component wrapping the input, label, hint etc..
      #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
      section :locality, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.address_locality'

      # County
      # @!method county
      #   A govuk text field component wrapping the input, label, hint etc..
      #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
      section :county, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.address_county'
      #Postcode
      element :invalid_post_code, :error, 'activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.address_post_code.invalid'
      # @!method post_code
      #   A govuk text field component wrapping the input, label, hint etc..
      #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
      section :post_code, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.address_post_code'
    end

  end
end

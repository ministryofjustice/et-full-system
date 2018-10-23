module EtFullSystem
  module Test
    class GroupClaimantSection < BaseSection
      section :title, :question_labelled, 'simple_form.labels.claimant.title' do
        include ::EtFullSystem::Test::I18n
        def set(value)
          root_element.select(factory_translate(value))
        end
      end
      #first name
      section :first_name, :question_labelled, 'simple_form.labels.claimant.first_name' do
        element :field, :css, 'input'
        delegate :set, to: :field
      end
      #lastname name
      section :last_name, :question_labelled, 'simple_form.labels.claimant.last_name' do
        element :field, :css, 'input'
        delegate :set, to: :field
      end
      #Date of birth
      element :date_of_birth_labelled, :legend_header, 'claims.personal_details.date_of_birth'
      element :date_of_birth_hint, :paragraph, 'simple_form.hints.claimant.date_of_birth'
      section :date_of_birth, '.know-date-input' do
        section :day, :question_labelled, 'simple_form.labels.claimant.date_of_birth.day' do
          element :field, :css, 'input[type="tel"]'
          delegate :set, to: :field
        end
        section :month, :question_labelled, 'simple_form.labels.claimant.date_of_birth.month' do
          element :field, :css, 'input[type="tel"]'
          delegate :set, to: :field
        end
        section :year, :question_labelled, 'simple_form.labels.claimant.date_of_birth.year' do
          element :field, :css, 'input[type="tel"]'
          delegate :set, to: :field
        end
        def set(value)
          (day_value, month_value, year_value) = value.split("/")
          day.set(day_value)
          month.set(month_value)
          year.set(year_value)
        end
      end
      #Building number or name
      section :building, :question_labelled, 'simple_form.labels.claimant.address_building' do
        element :field, :css, 'input'
        delegate :set, to: :field
      end
      #Street
      section :street, :question_labelled, 'simple_form.labels.claimant.address_street' do
        element :field, :css, 'input'
        delegate :set, to: :field
      end
      #Town/city
      section :locality, :question_labelled, 'simple_form.labels.claimant.address_locality' do
        element :field, :css, 'input'
        delegate :set, to: :field
      end
      #County
      section :county, :question_labelled, 'simple_form.labels.claimant.address_county' do
        element :field, :css, 'input'
        delegate :set, to: :field
      end
      #Postcode
      section :post_code, :question_labelled, 'simple_form.labels.claimant.address_post_code' do
        element :field, :css, 'input'
        delegate :set, to: :field
      end

    end

  end
end

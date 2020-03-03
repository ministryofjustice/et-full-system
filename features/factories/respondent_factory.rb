require 'faker'

FactoryBot.define do
  factory :respondent, class: OpenStruct do
    trait :work_address do
        work_building {'101'}
        work_street {'Petty France'}
        work_locality {'London'}
        work_county {'Greater London'}
        work_post_code {'WD18 7SQ'}
        work_telephone_number {'03333 423554'}
        work_office {'Watford, 3rd Floor, Radius House, 51 Clarendon Rd, Watford, WD17 1HP'}
    end

    trait :yes_acas do
      name { Faker::Company.name }
      building { Faker::Address.building_number }
      street { Faker::Address.street_name }
      locality {'London'}
      county {'Greater London'}
      post_code {'SW1H 9QR'}
      acas_number {'R000100/18/68'}
      telephone_number {'02222 321654'}
      office {'London Central, Victory House, 30-34 Kingsway, London WC2B 6EX'}
    end

    trait :no_acas do
      name { Faker::Company.name }
      building { Faker::Address.building_number }
      street { Faker::Address.street_name }
      locality {'London'}
      county {'Greater London'}
      post_code {'SW1H 9QR'}
      no_acas_number_reason {:"simple_form.options.respondent.no_acas_number_reason.joint_claimant_has_acas_number"}
      telephone_number {'02222 321654'}
      office {'London Central, Victory House, 30-34 Kingsway, London WC2B 6EX'}
    end

    trait :secondary do
      telephone_number {nil}
    end

    trait :conciliation_acas_number do
      work_address
      yes_acas
    end

    trait :invalid_acas_number do
      work_address
      yes_acas
      acas_number { 'R000201/18/68' }
    end

    factory :acas_number_reason, traits: [:work_address, :no_acas]
    factory :no_work_address, traits: [:yes_acas]
    factory :et3_data, traits: [:work_address, :yes_acas]
  end
end
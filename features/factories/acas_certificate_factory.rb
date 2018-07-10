FactoryBot.define do
  factory :acas_certificate, class: OpenStruct do
    trait :valid do
      number 'R000082/18/41'
      date_of_receipt Time.parse('01/01/2017 12:00:00')
      date_of_issue Time.parse('01/12/2017 12:00:00')
      method_of_issue 'Email'
      respondent_name 'Respondent Name'
      claimant_name 'Claimant Name'
    end
    trait :invalid do
      number 'R000201/18/68'
    end

  end
end
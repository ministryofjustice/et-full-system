require 'faker'

FactoryBot.define do
  factory :employment, class: OpenStruct do
    current_work_situation 'Still working for this employer'
    job_title { Faker::Company.profession }
    start_date '18/11/2009'
    notice_period '3 Months'
    average_weekly_hours '38'
    pay_before_tax '3000 Monthly'
    pay_after_tax '2000 Monthly'
    employers_pension_scheme 'Yes'
    benefits 'Company car, private health care'
  end
end

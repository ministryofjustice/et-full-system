require 'faker'

FactoryBot.define do
  factory :employment, class: OpenStruct do
    trait :notice_period do
      employment_details :"claims.employment.yes"
      current_work_situation :"simple_form.options.employment.current_situation.notice_period"
      job_title { Faker::Company.profession }
      start_date '18/11/2009'
      notice_period_end_date '01/01/2025'
      notice_period_type :"simple_form.options.employment.notice_pay_period_type.months"
      average_weekly_hours '38'
      pay_before_tax '3000'
      pay_before_tax_type :"simple_form.options.employment.gross_pay_period_type.monthly"
      pay_after_tax '2000' 
      pay_after_tax_type :"simple_form.options.employment.net_pay_period_type.monthly"
      employers_pension_scheme :"claims.employment.true"
      benefits 'Company car, private health care'
      # end_date nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in pdf code and submission page code
      # paid_for_notice_period nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in pdf code
      # new_job nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
      # new_job_gross_pay nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
      # new_job_gross_pay_type nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
      # notice_pay nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
      # notice_pay_type nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
      # notice_period_end_date nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
    end

    trait :still_employed do
      employment_details :"claims.employment.yes"
      current_work_situation :"simple_form.options.employment.current_situation.still_employed"
      job_title { Faker::Company.profession }
      start_date '18/11/2009'
      notice_period nil
      notice_period_type nil
      average_weekly_hours '38'
      pay_before_tax '3000'
      pay_before_tax_type :"simple_form.options.employment.gross_pay_period_type.monthly"
      pay_after_tax '2000' 
      pay_after_tax_type :"simple_form.options.employment.net_pay_period_type.monthly"
      employers_pension_scheme :"claims.employment.true"
      benefits 'Company car, private health care'
      paid_for_notice_period nil
      #New Job
      new_job :"claims.employment.no"
      new_job_start_date nil
      new_job_before_tax nil
      new_job_pay_before_tax nil
      # end_date nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in pdf code and submission page code
      # paid_for_notice_period nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in pdf code
      # new_job nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
      # new_job_gross_pay nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
      # new_job_gross_pay_type nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
      # notice_pay nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
      # notice_pay_type nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
      # notice_period_end_date nil # This isnt used to fill in any forms yet, but perhaps should be.  It is being validated against in submission page code
    end

    trait :employment_terminated do
      employment_details :"claims.employment.yes"
      current_work_situation :"simple_form.options.employment.current_situation.employment_terminated"
      job_title { Faker::Company.profession }
      start_date '18/11/2009'
      end_date '01/01/2019'
      #Did you work (or get paid for) a period of notice?
      paid_for_notice_period :"claims.employment.yes"
      notice_period '3'
      notice_period_type :"simple_form.options.employment.notice_pay_period_type.months"
      average_weekly_hours '38'
      # Pay, pension and benefits
      pay_before_tax '3000'
      pay_before_tax_type :"simple_form.options.employment.gross_pay_period_type.monthly"
      pay_after_tax '2000' 
      pay_after_tax_type :"simple_form.options.employment.net_pay_period_type.monthly"
      employers_pension_scheme :"claims.employment.true"
      benefits 'Company car, private health care'
      #New Job
      new_job :"claims.employment.yes"
      new_job_start_date '18/11/2009'
      new_job_before_tax :"simple_form.options.employment.new_job_gross_pay_frequency.monthly"
      new_job_pay_before_tax '3000'
    end

    trait :no_employment_details do
      employment_details :"claims.employment.no"
    end
  end
end

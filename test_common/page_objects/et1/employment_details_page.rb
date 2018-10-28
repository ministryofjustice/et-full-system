require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class EmploymentDetailsPage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #Employment details
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claims.employment.header', exact: false
        end
        section :main_content, '#content .main-section .main-content' do
          section :error_message, '#error-summary' do
            element :error_summary, :content_header, 'shared.error_notification.error_summary', exact: false
            element :default_message, :paragraph, 'shared.error_notification.default_message', exact: false
          end
          #Your employment details
          element :your_employment_details_header, :legend_header, 'claims.employment.situation_legend'
          section :your_employment_details, '.employment_was_employed' do
            #Have you ever been employed by the person or organisation that you’re making this claim against? (optional)
            element :employment_intro, :form_labelled, 'simple_form.labels.employment.was_employed'
            include ::EtFullSystem::Test::I18n
            element :yes, :form_labelled, 'claims.employment.yes' do
              element :selector, :css, 'input[type="radio"]'
              delegate :set, to: :selector
            end
            element :no, :form_labelled, 'claims.employment.no' do
              element :selector, :css, 'input[type="radio"]'
              delegate :set, to: :selector
            end
            def set(value)
              choose(factory_translate(value), name: 'employment[was_employed]')
            end
          end
          #What is your current work situation in relation to the employer you're making a claim against?
          element :current_work_situation_labelled, :legend_header, 'claims.employment.current_situation', exact: false
          section :employment_current_situation, '.employment_current_situation' do
            include ::EtFullSystem::Test::I18n
            element :still_employed, :form_labelled, 'simple_form.options.employment.current_situation.still_employed' do
              element :selector, :css, 'input[type="radio"]'
              delegate :set, to: :selector
            end
            element :notice_period, :form_labelled, 'simple_form.options.employment.current_situation.notice_period' do
              element :selector, :css, 'input[type="radio"]'
              delegate :set, to: :selector
            end
            element :employment_terminated, :form_labelled, 'simple_form.options.employment.current_situation.employment_terminated' do
              element :selector, :css, 'input[type="radio"]'
              delegate :set, to: :selector
            end
            def set(value)
              choose(factory_translate(value), name: 'employment[current_situation]')
            end
          end
          #Employment details
          element :employment_details_header, :legend_header, 'claims.employment.situation_legend'
          #Job title (optional)
          section :employment_job_title, :question_labelled, 'simple_form.labels.employment.job_title' do
            #The job you were doing at the time of the problem at work
            element :job_title, :paragraph, 'simple_form.hints.employment.job_title'
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          #Employment start date
          section :employment_start_date, :legend_header, 'claims.employment.start_date', exact: false do
            element :error_employment_start_date, :error, 'activemodel.errors.models.employment.attributes.employment_start_date.too_young'
            element :invalid_employment_start_date, :error, 'activemodel.errors.models.employment.attributes.employment_start_date.invalid'
            #For example, 22 04 2014 (if you don’t know the exact date then put your best estimate)
            element :employment_start_date_hint, :paragraph, 'simple_form.hints.employment.start_date'
            section :day, :question_labelled, 'simple_form.labels.employment.start_date.day' do
              element :field, :css, 'input'
              delegate :set, to: :field
            end
            section :month, :question_labelled, 'simple_form.labels.employment.start_date.month' do
              element :field, :css, 'input'
              delegate :set, to: :field
            end
            section :year, :question_labelled, 'simple_form.labels.employment.start_date.year' do
              element :field, :css, 'input'
              delegate :set, to: :field
            end
            def set(value)
              (day_value, month_value, year_value) = value.split("/")
              day.set(day_value)
              month.set(month_value)
              year.set(year_value)
            end
          end
          #Employment end date
          section :employment_end_date, :legend_header, 'claims.employment.end_date', exact: false do
            element :error_employment_end_date, :error, 'activemodel.errors.models.employment.attributes.employment_end_date.too_young'
            element :invalid_employment_end_date, :error, 'activemodel.errors.models.employment.attributes.employment_end_date.invalid'
            #For example, 22 04 2014 (if you don’t know the exact date then put your best estimate)
            element :employment_end_date_hint, :paragraph, 'simple_form.hints.employment.end_date'
            section :day, :question_labelled, 'simple_form.labels.employment.end_date.day' do
              element :field, :css, 'input'
              delegate :set, to: :field
            end
            section :month, :question_labelled, 'simple_form.labels.employment.end_date.month' do
              element :field, :css, 'input'
              delegate :set, to: :field
            end
            section :year, :question_labelled, 'simple_form.labels.employment.end_date.year' do
              element :field, :css, 'input'
              delegate :set, to: :field
            end
            def set(value)
              (day_value, month_value, year_value) = value.split("/")
              day.set(day_value)
              month.set(month_value)
              year.set(year_value)
            end
          end
          #Did you work (or get paid for) a period of notice?
          element :worked_notice_period_or_paid_in_lieu, :legend_header, 'claims.employment.worked_notice_period_or_paid_in_lieu'
          section :period_of_notice, '.options' do
            include ::EtFullSystem::Test::I18n
            element :yes, :form_labelled, 'claims.employment.yes' do
              element :selector, :css, 'input[type="radio"]'
              delegate :set, to: :selector
            end
            element :no, :form_labelled, 'claims.employment.no' do
              element :selector, :css, 'input[type="radio"]'
              delegate :set, to: :selector
            end
            def set(value)
              choose(factory_translate(value), name: 'employment[worked_notice_period_or_paid_in_lieu]')
            end
          end
          #For how many weeks or months did you get paid? (optional)
          section :reveal_notice_pay_period, '#reveal_notice_pay_period' do
            element :notice_pay_period_count, :form_labelled, 'simple_form.labels.employment.notice_pay_period_count'
            section :slim_fieldset, '.slim-fieldset' do
              include ::EtFullSystem::Test::I18n
              element :field, :css, 'input'
              delegate :set, to: :field
              section :employment_notice_pay_period_type, '.employment_notice_pay_period_type .options' do
                element :weeks, :form_labelled, 'simple_form.options.employment.notice_pay_period_type.weeks' do
                  element :selector, :css, 'input[type="radio"]'
                  delegate :set, to: :selector
                end
                element :months, :form_labelled, 'simple_form.options.employment.notice_pay_period_type.months' do
                  element :selector, :css, 'input[type="radio"]'
                  delegate :set, to: :selector
                end
                def set(value)
                  choose(factory_translate(value), name: 'employment[notice_pay_period_type]')
                end
              end
            end
          end
          #Average hours worked per week (optionl)
          section :employment_average_hours_worked_per_week, '.employment_average_hours_worked_per_week' do
            element :average_hours_worked_per_week, :form_labelled, 'simple_form.labels.employment.average_hours_worked_per_week'
            #Don’t include overtime
            element :overtime_hint, :form_hint, 'simple_form.hints.employment.average_hours_worked_per_week'
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          #Pay, pension and benefits
          element :pay_pension_benefits, :legend_header, 'claims.employment.pay_legend'
          #Pay before tax (optional)
          section :employment_gross_pay, '.employment_gross_pay' do
            element :gross_pay, :form_labelled, 'simple_form.labels.employment.gross_pay'
            #This is your gross pay, before tax and other deductions. You can find it on your payslip. Don’t include any overtime payments
            element :gross_pay_hint, :form_hint, 'simple_form.hints.employment.gross_pay'
            section :inline_fieldset, '.prefixed-field.inline-fields' do
              include ::EtFullSystem::Test::I18n
              element :field, :css, 'input'
              delegate :set, to: :field
              section :employment_gross_pay_period_type, '.employment_gross_pay_period_type .options' do
                element :weekly, :form_labelled, 'simple_form.options.employment.gross_pay_period_type.weekly' do
                  element :selector, :css, 'input[type="radio"]'
                  delegate :set, to: :selector
                end
                element :monthly, :form_labelled, 'simple_form.options.employment.gross_pay_period_type.monthly' do
                  element :selector, :css, 'input[type="radio"]'
                  delegate :set, to: :selector
                end
                def set(value)
                  choose(factory_translate(value), name: 'employment[gross_pay_period_type]')
                end
              end
            end
          end
          #Pay after tax (optional)
          section :employment_net_pay, '.employment_net_pay' do
            element :net_pay, :form_labelled, 'simple_form.labels.employment.net_pay'
            #This is your net or take-home pay, after tax and other deductions. You can find it on your payslip. Include overtime, commission and bonuses
            element :net_pay_hint, :form_hint, 'simple_form.hints.employment.net_pay'
            section :inline_fieldset, '.prefixed-field.inline-fields' do
              include ::EtFullSystem::Test::I18n
              element :field, :css, 'input'
              delegate :set, to: :field
              section :employment_net_pay_period_type, '.employment_net_pay_period_type .options' do
                element :weekly, :form_labelled, 'simple_form.options.employment.net_pay_period_type.weekly' do
                  element :selector, :css, 'input[type="radio"]'
                  delegate :set, to: :selector
                end
                element :monthly, :form_labelled, 'simple_form.options.employment.net_pay_period_type.monthly' do
                  element :selector, :css, 'input[type="radio"]'
                  delegate :set, to: :selector
                end
                def set(value)
                  choose(factory_translate(value), name: 'employment[net_pay_period_type]')
                end
              end
            end
          end
          #Are – or were – you a member of your employer’s pension scheme? (optional)
          section :employment_enrolled_in_pension_scheme, '.employment_enrolled_in_pension_scheme' do
            element :enrolled_in_pension_scheme, :form_labelled, 'simple_form.labels.employment.enrolled_in_pension_scheme'
            section :pension_scheme, '.options' do
              include ::EtFullSystem::Test::I18n
              element :yes, :form_labelled, 'claims.employment.true' do
                element :selector, :css, 'input[type="radio"]'
                delegate :set, to: :selector
              end
              element :no, :form_labelled, 'claims.employment.false' do
                element :selector, :css, 'input[type="radio"]'
                delegate :set, to: :selector
              end
              def set(value)
                choose(factory_translate(value), name: 'employment[enrolled_in_pension_scheme]')
              end
            end
          end
          #Do – or did – you have any benefits, like a company car? (optional)
          section :employment_benefit_details, '.employment_benefit_details' do
            element :benefit_details, :form_labelled, 'simple_form.labels.employment.benefit_details'
            #Details of benefit(s)
            element :benefit_details_hint, :form_hint, 'simple_form.hints.employment.benefit_details'
            element :field, :css, 'input'
            delegate :set, to: :field
          end

          #Save and continue
          element :save_and_continue_button, :submit_text, 'helpers.submit.update', exact: false
        end
        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
          element :your_claim, :support_header, 'shared.aside.actions_header'
          element :save_and_complete_later, :button, 'shared.mobile_nav.save_and_complete'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def has_correct_translation?
          #your feedback header
          expect(feedback_notice).to have_language
          expect(feedback_notice).to have_feedback_link
          #Employment details
          expect(main_header).to have_page_header
          #Your employment details
          expect(main_content).to have_your_employment_details_header
          #Have you ever been employed by the person or organisation that you’re making this claim against? (optional)
          expect(main_content.your_employment_details).to have_employment_intro
          expect(main_content.your_employment_details).to have_yes
          expect(main_content.your_employment_details).to have_no
          #What is your current work situation in relation to the employer you're making a claim against?
          expect(main_content).to have_current_work_situation_labelled
          expect(main_content.employment_current_situation).to have_still_employed
          expect(main_content.employment_current_situation).to have_notice_period
          expect(main_content.employment_current_situation).to have_employment_terminated
          #Employment details
          expect(main_content).to have_employment_details_header
          #Job title (optional)
          expect(main_content).to have_employment_job_title
          expect(main_content.employment_job_title).to have_job_title
          #Employment start date
          expect(main_content).to have_employment_start_date
          expect(main_content.employment_start_date).to have_employment_start_date_hint
          expect(main_content.employment_start_date).to have_day
          expect(main_content.employment_start_date).to have_month
          expect(main_content.employment_start_date).to have_year
          #Employment end date
          expect(main_content).to have_employment_end_date
          expect(main_content.employment_end_date).to have_employment_end_date_hint
          expect(main_content.employment_end_date).to have_day
          expect(main_content.employment_end_date).to have_month
          expect(main_content.employment_end_date).to have_year
          #Did you work (or get paid for) a period of notice?
          expect(main_content).to have_worked_notice_period_or_paid_in_lieu
          expect(main_content.period_of_notice).to have_yes
          expect(main_content.period_of_notice).to have_no
          #For how many weeks or months did you get paid? (optional)
          expect(main_content.reveal_notice_pay_period).to have_notice_pay_period_count
          expect(main_content.reveal_notice_pay_period.slim_fieldset.employment_notice_pay_period_type).to have_weeks
          expect(main_content.reveal_notice_pay_period.slim_fieldset.employment_notice_pay_period_type).to have_months
          #Average hours worked per week (optional)
          expect(main_content.employment_average_hours_worked_per_week).to have_average_hours_worked_per_week
          expect(main_content.employment_average_hours_worked_per_week).to have_overtime_hint
          #Pay, pension and benefits
          expect(main_content).to have_pay_pension_benefits
          #Pay before tax (optionl)
          expect(main_content.employment_gross_pay).to have_gross_pay
          expect(main_content.employment_gross_pay).to have_gross_pay_hint
          expect(main_content.employment_gross_pay.inline_fieldset.employment_gross_pay_period_type).to have_weekly
          expect(main_content.employment_gross_pay.inline_fieldset.employment_gross_pay_period_type).to have_monthly
          #Pay after tax (optional)
          expect(main_content.employment_net_pay).to have_net_pay
          expect(main_content.employment_net_pay).to have_net_pay_hint
          expect(main_content.employment_net_pay.inline_fieldset.employment_net_pay_period_type).to have_weekly
          expect(main_content.employment_net_pay.inline_fieldset.employment_net_pay_period_type).to have_monthly
          #Are – or were – you a member of your employer’s pension scheme? (optional)
          expect(main_content.employment_enrolled_in_pension_scheme).to have_enrolled_in_pension_scheme
          expect(main_content.employment_enrolled_in_pension_scheme.pension_scheme).to have_yes
          expect(main_content.employment_enrolled_in_pension_scheme.pension_scheme).to have_no
          #Do – or did – you have any benefits, like a company car? (optional)
          expect(main_content.employment_benefit_details).to have_benefit_details
          expect(main_content.employment_benefit_details).to have_benefit_details_hint
          #Save and continue
          expect(main_content).to have_save_and_continue_button
          #Support
          expect(support).to have_suport_header
          expect(support).to have_guide
          expect(support).to have_contact_use
          #Save your claim later
          expect(support).to have_your_claim
          #TODO this has stopped working - why?
          # expect(support).to have_save_and_complete_later
        end

        def has_correct_blank_validation?
          expect(main_content.error_message).to have_error_summary
          expect(main_content.error_message).to have_default_message
          expect(main_content.respondent_2).to have_blank_name
          expect(main_content.respondent_2).to have_blank_building
          expect(main_content.respondent_2).to have_blank_street
          expect(main_content.respondent_2).to have_blank_locality
          expect(main_content.respondent_2).to have_blank_county
          expect(main_content.respondent_2).to have_blank_post_code
          expect(main_content.respondent_2).to have_blank_acas_number
        end

        def set_for(employment)
          data = employment.to_h
          if data.nil? || data == {}
            main_content.your_employment_details.set('No')
          else
            main_content.your_employment_details do |s|
              s.set 'Yes'
              set_field s, :current_work_situation, data
              s.employment_details do |s|
                set_field s, :job_title, data
                set_field s, :start_date, data
                if data.key?(:notice_period)
                  s.notice_period.set 'Yes'
                  s.notice_period_value.set data[:notice_period]
                else
                  s.notice_period.set 'No'
                end
                set_field s, :average_weekly_hours, data
              end
              s.pay_pension_benefits do |s|
                set_field s, :pay_before_tax, data
                set_field s, :pay_after_tax, data
                set_field s, :employers_pension_scheme, data
                set_field s, :benefits, data
              end
            end
          end
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end

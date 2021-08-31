require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class EmploymentDetailsPage < BasePage
        include RSpec::Matchers
        #Employment details
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claims.employment.header', exact: false
        end
        section :main_content, '#main-content' do
          include EtTestHelpers::Section
          section :error_message, '#error-summary' do
            element :error_summary, :content_header, 'shared.error_notification.error_summary', exact: false
            element :default_message, :paragraph, 'shared.error_notification.default_message', exact: false
          end
          #Your employment details
          element :your_employment_details_header, :legend_header, 'claims.employment.situation_legend'
          # @!method your_employment_details
          #   A govuk radio button component for your_employment_details question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          section :your_employment_details, govuk_component(:collection_radio_buttons), :govuk_collection_radio_buttons, :'simple_form.labels.employment.was_employed' do
            element :employment_intro, :form_labelled, 'simple_form.labels.employment.was_employed'
            include ::EtFullSystem::Test::I18n
            element :yes, :form_labelled, 'claims.employment.yes' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            element :no, :form_labelled, 'claims.employment.no' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
          end
          #What is your current work situation in relation to the employer you're making a claim against?
          element :current_work_situation_labelled, :legend_header, 'claims.employment.current_situation', exact: false
          # @!method employment_current_situation
          #   A govuk radio button component for employment_current_situation question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          section :employment_current_situation, govuk_component(:collection_radio_buttons), :govuk_collection_radio_buttons, :'claims.employment.current_situation' do
            element :error_current_situation, :error, 'activemodel.errors.models.employment.attributes.current_situation.blank'
            include ::EtFullSystem::Test::I18n
            element :still_employed, :form_labelled, 'simple_form.options.employment.current_situation.still_employed' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            element :notice_period, :form_labelled, 'simple_form.options.employment.current_situation.notice_period' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            element :employment_terminated, :form_labelled, 'simple_form.options.employment.current_situation.employment_terminated' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
          end
          #Employment details
          element :employment_details_header, :legend_header, 'claims.employment.situation_legend'

          # @!method employment_job_title
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :employment_job_title, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.employment.job_title' do
            element :job_title, :form_labelled, 'simple_form.labels.employment.job_title'
            #The job you were doing at the time of the problem at work
            element :job_title_hint, :form_hint, 'simple_form.hints.employment.job_title'
          end

          # @!method employment_start_date
          #   A govuk date field component wrapping the inputs, label, hint etc.. for a date question
          #   @return [EtTestHelpers::Components::GovUKDateField] The site prism section
          section :employment_start_date, govuk_component(:date_field), :govuk_date_field, :'claims.employment.start_date' do
            element :invalid_employment_start_date, :error, 'activemodel.errors.models.employment.attributes.start_date.invalid'
            #For example, 22 04 2014 (if you don’t know the exact date then put your best estimate)
            element :employment_start_date_hint, :form_hint, 'simple_form.hints.employment.start_date'
          end
          #Notice period end date
          section :notice_period, :css, 'fieldset[data-show-array="notice_period"]' do
            # section :notice_period_end_date, :legend_header, 'claims.employment.notice_period_end_date', exact: false do
              element :invalid_employment_notice_period_end_date, :error, 'activemodel.errors.models.employment.attributes.notice_period_end_date.invalid'
              #The date your employment ends. For example, 22 04 2014
              element :employment_notice_period_end_date_hint, :form_hint, 'simple_form.hints.employment.notice_period_end_date'
              section :day, :question_labelled, 'simple_form.labels.employment.notice_period_end_date.day' do
                element :field, :css, '#employment_notice_period_end_date_day'
                def set(*args); field.set(*args); end
              end
              section :month, :question_labelled, 'simple_form.labels.employment.notice_period_end_date.month' do
                element :field, :css, '#employment_notice_period_end_date_month'
                def set(*args); field.set(*args); end
              end
              section :year, :question_labelled, 'simple_form.labels.employment.notice_period_end_date.year' do
                element :field, :css, '#employment_notice_period_end_date_year'
                def set(*args); field.set(*args); end
              end
              def set(value)
                (day_value, month_value, year_value) = value.split("/")
                day.set(day_value)
                month.set(month_value)
                year.set(year_value)
              end
            # end
          end
          #Employment end date
          section :employment_end_date, :legend_header, 'claims.employment.end_date', exact: false do
            element :invalid_employment_end_date, :error, 'activemodel.errors.models.employment.attributes.end_date.invalid'
            #For example, 22 04 2014 (if you don’t know the exact date then put your best estimate)
            element :employment_end_date_hint, :form_hint, 'simple_form.hints.employment.end_date', exact: false
            section :day, :question_labelled, 'simple_form.labels.employment.end_date.day' do
              element :field, :css, '#employment_end_date_day'
              def set(*args); field.set(*args); end
            end
            section :month, :question_labelled, 'simple_form.labels.employment.end_date.month' do
              element :field, :css, '#employment_end_date_month'
              def set(*args); field.set(*args); end
            end
            section :year, :question_labelled, 'simple_form.labels.employment.end_date.year' do
              element :field, :css, '#employment_end_date_year'
              def set(*args); field.set(*args); end
            end
            def set(value)
              (day_value, month_value, year_value) = value.split("/")
              day.set(day_value)
              month.set(month_value)
              year.set(year_value)
            end
          end
          # @!method worked_notice_period_or_paid_in_lieu_question
          #   A govuk radio button component for 'Did you work (or get paid for) a period of notice?' question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          section :worked_notice_period_or_paid_in_lieu, govuk_component(:collection_radio_buttons), :govuk_collection_radio_buttons, :'claims.employment.worked_notice_period_or_paid_in_lieu' do
            include ::EtFullSystem::Test::I18n
            element :yes, :form_labelled, 'claims.employment.yes' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            element :no, :form_labelled, 'claims.employment.no' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
          end
          #For how many weeks or months did you get paid? (optional)
          section :notice_period_value, '#reveal_notice_pay_period' do
            element :notice_pay_period_count, :form_labelled, 'simple_form.labels.employment.notice_pay_period_count'
            section :notice_pay, '.inline-fields.slim-fieldset' do
              element :field, :css, '#employment_notice_pay_period_count'
              def set(*args); field.set(*args); end
              section :employment_notice_pay_period_type, '.employment_notice_pay_period_type .options' do
                include ::EtFullSystem::Test::I18n
                element :weeks, :form_labelled, 'simple_form.options.employment.notice_pay_period_type.weeks' do
                  element :selector, :css, '#employment_notice_pay_period_type_weeks'
                  def set(*args); selector.set(*args); end
                end
                element :months, :form_labelled, 'simple_form.options.employment.notice_pay_period_type.months' do
                  element :selector, :css, '#employment_notice_pay_period_type_months'
                  def set(*args); selector.set(*args); end
                end
                def set(value)
                  choose(factory_translate(value), name: "employment[notice_pay_period_type]")
                end
              end
            end
            def set(value)
              notice_pay.set(value)
            end
          end

          # @!method employment_average_hours_worked_per_week
          #   A govuk text field component for the 'Average hours worked per week (optional)' question
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :employment_average_hours_worked_per_week, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.employment.average_hours_worked_per_week' do
            element :average_hours_worked_per_week, :form_labelled, 'simple_form.labels.employment.average_hours_worked_per_week'
            #Don’t include overtime
            element :overtime_hint, :form_hint, 'simple_form.hints.employment.average_hours_worked_per_week'
          end
          #Pay, pension and benefits
          element :pay_pension_benefits, :legend_header, 'claims.employment.pay_legend'
          # @!method employment_pay_period_type
          #   A govuk radio button component for pay_period_type question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          section :employment_pay_period_type, govuk_component(:collection_radio_buttons), :govuk_collection_radio_buttons, :'review.employment.questions.pay_period_type.label'
          
          #Pay before tax (optional)
          # @!method employment_gross_pay
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :employment_gross_pay, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.employment.gross_pay' do
            #This is your gross pay, before tax and other deductions. You can find it on your payslip. Don’t include any overtime payments
            element :gross_pay_hint, :form_hint, 'simple_form.hints.employment.gross_pay'
          end


          # @!method employment_net_pay
          #   A govuk text field component for the 'Pay after tax (optional)' question
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :employment_net_pay, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.employment.net_pay' do
            #This is your net or take-home pay, after tax and other deductions. You can find it on your payslip. Include overtime, commission and bonuses
            element :net_pay_hint, :form_hint, 'simple_form.hints.employment.net_pay'
          end


          # @!method employment_enrolled_in_pension_scheme
          #   A govuk radio button component for 'Are – or were – you a member of your employer’s pension scheme? (optional)' question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          section :employment_enrolled_in_pension_scheme, govuk_component(:collection_radio_buttons), :govuk_collection_radio_buttons, :'simple_form.labels.employment.enrolled_in_pension_scheme' do
            include ::EtFullSystem::Test::I18n
            element :yes, :form_labelled, 'claims.employment.true' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            element :no, :form_labelled, 'claims.employment.false' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
          end
          #Do – or did – you have any benefits, like a company car? (optional)
          # @!method employment_benefit_details
          #   A govuk text area component wrapping the input, label, hint etc.. for a text area
          #   @return [EtTestHelpers::Components::GovUKTextArea] The site prism section
          section :employment_benefit_details, govuk_component(:text_area), :govuk_text_area, :'simple_form.labels.employment.benefit_details' do
            #Details of benefit(s)
            element :benefit_details_hint, :form_hint, 'simple_form.hints.employment.benefit_details'
          end
          #New Job
          section :notice_period_end_date, :legend_header, 'claims.employment.new_job_legend', exact: false do
            #Have you got a new job? (optional)
            element :employment_intro, :form_labelled, 'simple_form.labels.employment.was_employed'
            section :new_job, '.employment_found_new_job' do
              include ::EtFullSystem::Test::I18n
              element :yes, :form_labelled, 'claims.employment.new_job_legend.yes' do
                element :selector, :css, 'input[type="radio"]'
                def set(*args); selector.set(*args); end
              end
              element :no, :form_labelled, 'claims.employment.new_job_legend.no' do
                element :selector, :css, 'input[type="radio"]'
                def set(*args); selector.set(*args); end
              end
              def set(value)
                choose(factory_translate(value), name: 'employment[found_new_job]')
              end
            end

            #New job start date
            section :new_job_start_date, :legend_header, 'claims.employment.new_job_start_date' do
              element :invalid_new_job_start_date, :error, 'activemodel.errors.models.employment.attributes.new_job_start_date.invalid'
              #The date your employment ends. For example, 22 04 2014
              element :employment_new_job_start_date_hint, :form_hint, 'simple_form.hints.employment.new_job_start_date'
              section :day, :question_labelled, 'simple_form.labels.employment.start_date.day' do
                element :field, :css, '#employment_new_job_start_date_day'
                def set(*args); field.set(*args); end
              end
              section :month, :question_labelled, 'simple_form.labels.employment.start_date.month' do
                element :field, :css, '#employment_new_job_start_date_month'
                def set(*args); field.set(*args); end
              end
              section :year, :question_labelled, 'simple_form.labels.employment.start_date.year' do
                element :field, :css, '#employment_new_job_start_date_year'
                def set(*args); field.set(*args); end
              end
              def set(value)
                (day_value, month_value, year_value) = value.split("/")
                day.set(day_value)
                month.set(month_value)
                year.set(year_value)
              end
            end

            #New job pay before tax (optional)
            element :new_job_gross_pay, :form_labelled, 'simple_form.labels.employment.new_job_gross_pay'
            #This is your gross pay, before tax and other deductions. You can find it on your payslip. Don’t include any overtime payments
            element :new_job_pay_before_tax_hint, :form_hint, 'simple_form.hints.employment.new_job_gross_pay'
            section :new_job_pay_before_tax, '.prefixed-field.inline-fields' do
              section :currency_field, '.currency_field' do
                element :field, :css, 'input'
                def set(*args); field.set(*args); end
              end
              section :new_job_pay_before_tax_type, '.input' do
                include ::EtFullSystem::Test::I18n
                element :weekly, :form_labelled, 'simple_form.options.employment.new_job_gross_pay_frequency.weekly' do
                  element :selector, :css, "#employment_new_job_gross_pay_frequency_weekly"
                  def set(*args); selector.set(*args); end
                end
                element :monthly, :form_labelled, 'simple_form.options.employment.new_job_gross_pay_frequency.monthly' do
                  element :selector, :css, "#employment_new_job_gross_pay_frequency_monthly"
                  def set(*args); selector.set(*args); end
                end
                def set(value)
                  choose(factory_translate(value), name: "employment[new_job_gross_pay_frequency]")
                end
              end
            end
          end

          #Save and continue
          element :save_and_continue_button, :submit_text, 'helpers.submit.update', exact: false
        end

        def save_and_continue
          page.scroll_to(main_content.save_and_continue_button, align: :bottom)
          main_content.save_and_continue_button.click
        end

        def switch_to_welsh
          feedback_notice.welsh_link.click
        end

        def switch_to_english
          feedback_notice.english_link.click
        end

        def has_correct_translation?
          #your feedback header
          expect(feedback_notice).to have_language
          expect(feedback_notice).to have_feedback_link
          expect(feedback_notice).to have_feedback_info
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
          expect(main_content.employment_job_title).to have_job_title
          expect(main_content.employment_job_title).to have_job_title_hint
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
          expect(main_content.worked_notice_period_or_paid_in_lieu).to have_yes
          expect(main_content.worked_notice_period_or_paid_in_lieu).to have_no
          #For how many weeks or months did you get paid? (optional)
          expect(main_content.notice_period_value).to have_notice_pay_period_count
          expect(main_content.notice_period_value.notice_pay.employment_notice_pay_period_type).to have_weeks
          expect(main_content.notice_period_value.notice_pay.employment_notice_pay_period_type).to have_months
          #Average hours worked per week (optional)
          expect(main_content.employment_average_hours_worked_per_week).to have_average_hours_worked_per_week
          expect(main_content.employment_average_hours_worked_per_week).to have_overtime_hint
          #Pay, pension and benefits
          expect(main_content).to have_pay_pension_benefits
          # How often were you paid (optional)
          expect(main_content).to have_employment_pay_period_type
          #Pay before tax (optional)
          expect(main_content).to have_employment_gross_pay
          expect(main_content.employment_gross_pay).to have_gross_pay_hint
          #Pay after tax (optional)
          expect(main_content).to have_employment_net_pay
          expect(main_content.employment_net_pay).to have_net_pay_hint
          #Are – or were – you a member of your employer’s pension scheme? (optional)
          expect(main_content).to have_employment_enrolled_in_pension_scheme
          expect(main_content.employment_enrolled_in_pension_scheme).to have_yes
          expect(main_content.employment_enrolled_in_pension_scheme).to have_no
          #Do – or did – you have any benefits, like a company car? (optional)
          expect(main_content).to have_employment_benefit_details
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

        def has_correct_error_message_for_current_work_situation?
          expect(main_content.error_message).to have_error_summary
          expect(main_content.error_message).to have_default_message
          expect(main_content.employment_current_situation).to have_error_current_situation
        end

        def has_correct_invalid_date_error_messages?
          expect(main_content.error_message).to have_error_summary
          expect(main_content.error_message).to have_default_message
          expect(main_content.employment_start_date).to have_invalid_employment_start_date
          # expect(main_content.employment_notice_period_end_date).to have_invalid_employment_end_date
        end

        def set(employment)
          data = employment.to_h
          if data[:employment_details] == :"claims.employment.yes"
            main_content do |s|
              s.your_employment_details.set(data[:employment_details])
              s.employment_current_situation.set(data[:current_work_situation])
              s.employment_job_title.set(data[:job_title])
              s.employment_start_date.set(data[:start_date])
  
              if data[:current_work_situation] == :"simple_form.options.employment.current_situation.notice_period"
                s.notice_period.set(data[:notice_period_end_date])
              end
              if data[:current_work_situation] == :"simple_form.options.employment.current_situation.employment_terminated"
                s.employment_end_date.set(data[:end_date])
              end
              if data[:paid_for_notice_period] == :"claims.employment.paid_for_notice_period.yes"
                s.worked_notice_period_or_paid_in_lieu.set(data[:paid_for_notice_period])
                s.notice_period_value.set(data[:notice_period])
                s.notice_period_value.notice_pay.employment_notice_pay_period_type.set(data[:notice_period_type])
              elsif data[:paid_for_notice_period] == :"claims.employment.paid_for_notice_period.no"
                s.worked_notice_period_or_paid_in_lieu.set(data[:paid_for_notice_period])
              end
              s.employment_average_hours_worked_per_week.set(data[:average_weekly_hours])
              s.employment_pay_period_type.set(data[:pay_period_type])
              s.employment_gross_pay.set(data[:pay_before_tax])
              s.employment_net_pay.set(data[:pay_after_tax])
              s.employment_enrolled_in_pension_scheme.set(data[:employers_pension_scheme])
              s.employment_benefit_details.set(data[:benefits])

              if data[:new_job] == :"claims.employment.new_job.yes"
                s.notice_period_end_date.new_job.set(data[:new_job])
                s.notice_period_end_date.new_job_start_date.set(data[:new_job_start_date])
                s.notice_period_end_date.new_job_pay_before_tax.currency_field.set(data[:new_job_pay_before_tax])
                s.notice_period_end_date.new_job_pay_before_tax.new_job_pay_before_tax_type.set(data[:new_job_pay_before_tax_type])
              end
            end
          else
            main_content.your_employment_details.set(:"claims.employment.no")
          end
        end
      end
    end
  end
end

Given("an employee making a claim wishing to be contacted by {string}") do |string|
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, title: :"simple_form.options.claimant.title.mr", correspondence: :"simple_form.options.claimant.contact_preference.#{string}")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim)
end

Given("an employee making a claim against {string} respondents") do |string|
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, string.to_i, :yes_acas)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim)
end

Given("an employee making a claim with joint claim acas number") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:acas_number_reason, 1, :no_acas, no_acas_number_reason: :"simple_form.options.respondent.no_acas_number_reason.joint_claimant_has_acas_number")
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim)
end

Given("an employee making a claim with no jurisdiction") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:acas_number_reason, 1, :no_acas, no_acas_number_reason: :"simple_form.options.respondent.no_acas_number_reason.acas_has_no_jurisdiction")
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim)
end

Given("an employee making a claim with employer contacted acas") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:acas_number_reason, 1, :no_acas, no_acas_number_reason: :"simple_form.options.respondent.no_acas_number_reason.employer_contacted_acas")
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim)
end

Given("an employee making a claim with interim relief") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:acas_number_reason, 1, :no_acas, no_acas_number_reason: :"simple_form.options.respondent.no_acas_number_reason.interim_relief")
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim)
end

Given("an employee making a claim against an employer not aware of multiple cases against the same employer") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, other_claimants: :"claims.claim_type.no", other_claimant_names: '')
end

Given("an employee making a claim against a trade union") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :no_employment_details)
  @claim = FactoryBot.create(:claim)
end

Given("an employee making a claim against an employer who never worked for them") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :no_employment_details)
  @claim = FactoryBot.create(:claim)
end

Given("an employee making a claim against an employer who is working against their notice period") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :notice_period)
  @claim = FactoryBot.create(:claim)
end

Given("an employee making a claim against an employer who is no longer working for them") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :employment_terminated)
  @claim = FactoryBot.create(:claim)
end
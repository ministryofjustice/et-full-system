Capybara.add_selector(:error_summary_heading) do
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.css('.error-summary-heading')[x.string.n.is(translated)] }
  end
end
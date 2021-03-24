Capybara.add_selector(:summary_text) do
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.css('summary.govuk-details__summary')[x.string.n.is(translated)] }
  end
end

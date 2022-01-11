Capybara.add_selector(:page_title) do
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.css('.govuk-heading-xl')[x.string.n.is(translated)] }
  end
end

Capybara.add_selector(:grid_row_with_col_labelled) do
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.css('.govuk-grid-row')[x.child(:div)[x.string.n.is(translated)]] }
  end
end

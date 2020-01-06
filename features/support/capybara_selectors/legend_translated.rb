Capybara.add_selector(:legend_translated) do
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:legend)[x.string.n.is(translated)] }
  end
end

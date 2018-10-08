Capybara.add_selector(:h1_text) do
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:h1)[x.string.n.is(translated)] }
  end
end

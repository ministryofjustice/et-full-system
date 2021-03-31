Capybara.add_selector(:h1) do
  label 'Paragraph with content'
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    @definition.label("h1 with content <#{translated}> (#{locator}) ")
    XPath.generate { |x| x.descendant(:h1)[x.string.n.is(translated)] }
  end
end

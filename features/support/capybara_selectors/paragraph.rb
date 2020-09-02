Capybara.add_selector(:paragraph) do
  label 'Paragraph with content'
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    @definition.label("Paragraph with content <#{translated}> (#{locator}) ")
    XPath.generate { |x| x.descendant(:p)[x.string.n.is(translated)] }
  end
end

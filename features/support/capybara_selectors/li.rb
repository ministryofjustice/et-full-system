Capybara.add_selector(:li) do
  label 'li with content'
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    @definition.label("li with content <#{translated}> (#{locator}) ")
    XPath.generate { |x| x.descendant(:li)[x.string.n.is(translated)] }
  end
end

Capybara.add_selector(:link_named) do
  label "Link named"
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    @definition.label("Link named <#{translated}> (#{locator}) ")
    XPath.generate { |x| x.descendant(:a)[x.string.n.starts_with(translated)] }
  end
end

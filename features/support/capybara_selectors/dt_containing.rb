Capybara.add_selector(:dt_containing) do
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    XPath.generate do |x|
      x.descendant(:dt)[x.string.n.equals(translated)]
    end
  end
end

Capybara.add_selector(:question_labelled) do
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:div)[x.child(:label)[x.string.n.is(translated)]] }
  end
end

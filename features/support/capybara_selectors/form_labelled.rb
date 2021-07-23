Capybara.add_selector(:form_labelled) do
  label 'form_labelled'
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    @definition.label("form_labelled '#{translated}'")
    XPath.generate { |x| x.descendant(:label)[x.string.n.is(translated)] }
  end
end

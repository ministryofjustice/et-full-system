Capybara.add_selector(:input_with_value) do
  label 'input_with_value'
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    @definition.label "input_with_value '#{translated}'"
    XPath.generate { |x| x.descendant(:input)[x.attr(:value).normalize.equals(translated)] }
  end
end

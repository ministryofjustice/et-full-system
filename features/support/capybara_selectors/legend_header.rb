Capybara.add_selector(:legend_header) do
  label 'Legend header'
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    @definition.label("Legend header labelled <#{translated}>")
    XPath.generate { |x| x.descendant(:fieldset)[x.child(:legend)[x.string.n.is(translated)]] }
  end
end

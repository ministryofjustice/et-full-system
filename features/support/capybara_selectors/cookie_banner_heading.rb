Capybara.add_selector(:cookie_banner_heading) do
  label 'Cookie banner heading'
  xpath do |locator, _options|
    translated = EtFullSystem::Test::Messaging.instance.translate(locator)
    @definition.label("cookie banner heading with content <#{translated}> (#{locator}) ")
    XPath.generate { |x| x.css('.govuk-cookie-banner__heading')[x.string.n.is(translated)] }
  end
end

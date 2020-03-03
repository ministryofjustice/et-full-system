Around do |scenario, blk|
  retried = false
  begin
    blk.call
  rescue Selenium::WebDriver::Error::UnknownError => ex
    raise ex if retried
    retried = true
    Capybara.current_session.reset!
    puts "********************************* Retrying scenario as selenium session needed re setting ********************************"
    sleep 2
    retry
  end
end
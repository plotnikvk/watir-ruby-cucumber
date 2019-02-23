Before do |scenario|
  ENV['BROWSER'] = "chrome" if ENV['BROWSER'].nil?
  @browser = Watir::Browser.new ENV['BROWSER'].to_sym
  @browser.window.maximize
end

After do |scenario|
  if scenario.failed?
    puts scenario.name
    puts scenario.exception.message
    filename = "screenshots/error-#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.png"
    dirname = File.dirname(filename)
    FileUtils.mkdir_p dirname
    @browser.screenshot.save filename
    embed filename, 'image/png', filename
  end
  @browser.close
end

World PageObject::PageFactory
PageObject.default_element_wait = 30
PageObject.default_page_wait = 30
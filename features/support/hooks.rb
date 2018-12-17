Before do |scenario|
 ENV['BROWSER'] = "chrome" if ENV['BROWSER'].nil?
 @browser = Watir::Browser.new ENV['BROWSER'].to_sym
 @browser.window.maximize
end

After do |scenario|
    if (scenario.failed?)
        @browser.driver.save_screenshot "failed.jpg"
        embed "failed.jpg", 'image/png'
    end
  @browser.quit
end

World PageObject::PageFactory
PageObject.default_element_wait = 30
PageObject.default_page_wait = 30
Before do |scenario|
begin
  ####################################
  @url_hub = 'http://localhost:4444/wd/hub'
  if ENV['REMOTE_HUB']
    @local = false
    @url_hub = ENV['REMOTE_HUB']
  else
    @local = true
  end
  ####################################
  if @local
    @browser = Watir::Browser.new :chrome
  else
    capabilities = Selenium::WebDriver::Remote::Capabilities.new
    capabilities.browser_name = :chrome
    @browser = Watir::Browser.new(
      :remote,
      url: @url_hub,
      desired_capabilities: capabilities
    )
    @browser.driver.file_detector = lambda do |args|
      str = args.first.to_s
      str if File.exist?(str)
    end
  end
  @browser.window.maximize
rescue StandardError => e
  puts e.message
  Process.exit(0)
end
end

After do |scenario|
  if scenario.failed?
    puts scenario.name
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
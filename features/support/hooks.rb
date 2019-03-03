Before do |scenario|
#   ENV['BROWSER'] = "chrome" if ENV['BROWSER'].nil?
#   @browser = Watir::Browser.new ENV['BROWSER'].to_sym
#   @browser.window.maximize
# end
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
  p scenario.methods
  @browser.window.maximize
rescue StandardError => e
  puts e.message
  Process.exit(0)
end
end

After do |scenario|
p "fgdfhfdhdfhf"
  if scenario.passed?
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
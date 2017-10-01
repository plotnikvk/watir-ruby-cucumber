require 'selenium-webdriver'
require 'cucumber'
require 'rspec'
require 'rake'
require 'bundler'

Before do |scenario|
    @driver = Selenium::WebDriver.for :chrome  
    
    @wait = Selenium::WebDriver::Wait.new(:timeout => 60)
end

After do |scenario|
    if scenario.failed? 
        puts scenario.name
        puts scenario.exception.message        
        @driver.save_screenshot("ERROR.png")
     else 
        @driver.close    
     end 
end

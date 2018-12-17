Given(/^открыли сайт "([^"]*)"$/) do |url|
  @browser.goto(url)
end

When(/^(открыли|выбрали раздел) "([^"]*)"$/) do |_action, section|
  on(MainPage).link_element(xpath: "//a[text()='#{section}']").when_present.click
end

When(/^открыли раздел "([^"]*)"$/) do |section|
  on(MainPage).link_element(xpath: "//span[text()='#{section}']/parent::a").when_present.click
end

When(/^задали параметр поиска от "([^"]*)"$/) do |price|
  on(MainPage).price_form_element.when_present.set(price)
  on(MainPage).price_form_element.when_present.send_keys(:tab)
end

When(/^выбрали производителя "([^"]*)"$/) do |manufacturer|
  if manufacturer == 'Apple'
    on(MainPage).apple_check_element.wait_until_present.check
  elsif manufacturer == 'Samsung'
    on(MainPage).samsung_check_element.wait_until_present.check
  end
end
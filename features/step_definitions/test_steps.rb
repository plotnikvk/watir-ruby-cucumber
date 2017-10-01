Given(/^Открываю в браузере Yandex.ru$/) do
    @driver.get('http://www.yandex.ru')
    @driver.manage().window().maximize()
end

When(/^Открываю Yandex.Маркет$/) do
    el = @driver.find_element(css: "div>a", with: 'Маркет')
    el if el && el.displayed?
    el.click
end
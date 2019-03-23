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
  on(MainPage).span_element(xpath: "//span[text()='#{manufacturer}']").wait_until_present.click
end

When(/^выбрали параметр фильтра "([^"]*)"$/) do |parametr| 
  count = 0
  begin
    if on(MainPage).show_by_element.present?
      on(MainPage).show_by_element.wait_until_present.click
      on(MainPage).span_element(text: "Показывать по #{parametr}").wait_until_present.click
      on(MainPage).wait_until(45, "The element has not expect text!") { on(MainPage).show_by_element.text.eql?("Показывать по #{parametr}") }
    end
  rescue StandardError => _error
    raise "Не удалось выбрать параметр фильтра c #{count} попыток" if count == 5

    count += 1
    retry
  end
end

When(/^проверили, что элементов на странице "([^"]*)"$/) do |parametr|
  on(MainPage).wait_until(45, "The page has not #{parametr} items!") { on(MainPage).choosen_items_elements.size.eql?(parametr.to_i) }
end

When(/^запомнили "([^"]*)" элемент в списке$/) do |number|
  p $remembered_text = on(MainPage).choosen_items_elements[number.to_i - 1].text
end

When(/^ввели в поисковую строку запомненное значение$/) do
  on(MainPage).search_field_element.send_keys($remembered_text)
  on(MainPage).search_field_element.send_keys(:enter)
end

When(/^проверили, что наименование товара соответствует запомненному значению$/) do
  sleep 5
  arr = []
  if on(MainPage).link_element(text: $remembered_text).present?
    condition = on(MainPage).link_element(text: $remembered_text).wait_until_present.text.eql?($remembered_text)
    raise 'На данной странице нет искомого элемента' unless condition

  else 
    condition = on(MainPage).h1_element(text: $remembered_text).wait_until_present.text.eql?($remembered_text)
    raise 'На данной странице нет искомого элемента' unless condition
      
  end  
end

When(/^выбрали сортировку "([^"]*)"$/) do |parametr|
  on(MainPage).link_element(text: parametr).wait_until_present.click
end

When(/^проверили, что элементы на странице отсортированы верно$/) do
  sleep 5
  arr = []
  on(MainPage).div_elements(xpath: "//div[@class='price']").each do |element|
    new_arr = element.text.split('&nbsp;')
    middle_var = if new_arr[0].include?(' ')
                   new_arr[0].delete(' ')
                 else
                   new_arr[0]
                 end
    arr << middle_var.to_i             
  end
  p arr
  i = 0
  while i < arr.size - 1
    raise 'Сортировка неверна' if arr[i] > arr[i + 1]
    i += 1
  end
end
class MainPage
  include PageObject

  PRICE_FORM_FROM_iNDEX = 0

  text_field(:price_form, id: 'glpricefrom', index: PRICE_FORM_FROM_iNDEX)
  button(:show_by, xpath: "//button[@role='listbox']")
  links(:choosen_items, xpath: "//div[@class='n-snippet-cell2__title']/a")
  text_field(:search_field, id: 'header-search')
end
class MainPage
  include PageObject

  PRICE_FORM_FROM_iNDEX = 0

  text_field(:price_form, id: 'glpricefrom', index: PRICE_FORM_FROM_iNDEX)
  checkbox(:apple_check, xpath: "//input[@name='Производитель Apple']")
  checkbox(:samsung_check, xpath: "//input[@name='Производитель Samsung']")
end
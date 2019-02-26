# encoding: UTF-8
# language: ru

@w
Функционал: Тест Яндекса
@w1
Сценарий: Поиск мобильного телефона
Допустим открыли сайт "http://www.yandex.ru"
И открыли "Маркет"
И открыли раздел "Электроника"
И выбрали раздел "Мобильные телефоны"
И задали параметр поиска от "20000"
И выбрали производителя "Apple"
И выбрали производителя "Samsung"
И выбрали параметр фильтра "12"
И проверили, что элементов на странице "12"
И запомнили "1" элемент в списке
И ввели в поисковую строку запомненное значение
И проверили, что наименование товара соответствует запомненному значению

@w2
Сценарий: Поиск наушников
Допустим открыли сайт "http://www.yandex.ru"
И открыли "Маркет"
И открыли раздел "Электроника"
И выбрали раздел "Наушники и Bluetooth-гарнитуры"
И задали параметр поиска от "5000"
И выбрали производителя "Beats"
И выбрали производителя "Apple"
И выбрали параметр фильтра "12"
И проверили, что элементов на странице "12"
И запомнили "1" элемент в списке
И ввели в поисковую строку запомненное значение
И проверили, что наименование товара соответствует запомненному значению

@w3
Сценарий: Поиск мобильного телефона
Допустим открыли сайт "http://www.yandex.ru"
И открыли "Маркет"
И открыли раздел "Электроника"
И выбрали раздел "Мобильные телефоны"
И выбрали сортировку "по цене"
Тогда проверили, что элементы на странице отсортированы верно
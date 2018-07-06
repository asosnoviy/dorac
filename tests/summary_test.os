#Использовать asserts
#Использовать "./../"
#Использовать moskito
#Использовать logos

Перем Лог;
Перем Дурак;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_СоздатьДурака");
	ВсеТесты.Добавить("ТестДолжен_Создатьsummary");
	ВсеТесты.Добавить("ТестДолжен_Проверитьinfo");

	Возврат ВсеТесты;

КонецФункции

Процедура ПередЗапускомТеста() Экспорт

	Если Лог = Неопределено Тогда
		Лог = Логирование.ПолучитьЛог("lib.dorac");
		Лог.УстановитьУровень(УровниЛога.Отладка);
	КонецЕсли;	

КонецПроцедуры	


Процедура ПослеЗапускаТеста() Экспорт

КонецПроцедуры	

Процедура ТестДолжен_СоздатьДурака() Экспорт

	
	Дурак = Новый Дурак("");
	Ожидаем.Что(ТипЗнч(Дурак)).Равно(Тип("Дурак"));
	Ожидаем.Что(ТипЗнч(Дурак.infobase("1"))).Равно(Тип("infobase"));
	Ожидаем.Что(ТипЗнч(Дурак.infobase("1").summary())).Равно(Тип("summary"));

КонецПроцедуры

Процедура ТестДолжен_Создатьsummary() Экспорт

	Вывод = "infobase : 09559b25-9c50-4d35-aace-635276577e65
	|name     : UH_DEV5
	|descr    :
	|
	|infobase : f6f3228d-83d0-47f4-84b0-3c4fe91d3e72
	|name     : UH_Osipov
	|descr    : На удаление 280218";

	Ответ = Новый Структура;
	Ответ.Вставить("КодВозврата", 0);
	Ответ.Вставить("Вывод", Вывод);

	МокИспонитель = Мок.Получить(Новый ИсполнительКоманд(""));
	МокИспонитель.Когда().ИсполнитьКоманду().ТогдаВозвращает(Ответ);
	Параметры = Новый Соответствие;
	Результат = Новый summary(Параметры, МокИспонитель).list();;


	Ожидаем.Что(Результат).ИмеетТип(Тип("Массив"));
	Ожидаем.Что(Результат[0].name).Равно("UH_DEV5");
	Ожидаем.Что(Результат[1].descr).Равно("На удаление 280218");

	Ответ = Новый Структура;
	Ответ.Вставить("КодВозврата", 1);
	Ответ.Вставить("Вывод", "Ошибка из мока, код возврата 1");
	МокИспонитель = Мок.Получить(Новый ИсполнительКоманд(""));
	МокИспонитель.Когда().ИсполнитьКоманду().ТогдаВозвращает(Ответ);

	Результат = Новый summary(Параметры, МокИспонитель).list();
	Ожидаем.Что(Результат.Количество()).Равно(0);


КонецПроцедуры


Процедура ТестДолжен_Проверитьinfo() Экспорт

	Вывод = "infobase : f6f3228d-83d0-47f4-84b0-3c4fe91d3e72
	|	name     : UH_Osipov
	|	descr    : ""На удаление 280218""
	|
	|";

	Ответ = Новый Структура;
	Ответ.Вставить("КодВозврата", 0);
	Ответ.Вставить("Вывод", Вывод);

	МокИспонитель = Мок.Получить(Новый ИсполнительКоманд(""));
	МокИспонитель.Когда().ИсполнитьКоманду().ТогдаВозвращает(Ответ);

	Параметры = Новый Соответствие;
	Результат = Новый summary(Параметры, МокИспонитель).info("f6f3228d-83d0-47f4-84b0-3c4fe91d3e72");

	Ожидаем.Что(Результат).ИмеетТип(Тип("Структура"));
	Ожидаем.Что(Результат.infobase).Равно("f6f3228d-83d0-47f4-84b0-3c4fe91d3e72");
	Ожидаем.Что(Результат.name).Равно("UH_Osipov");
	Ожидаем.Что(Результат.descr).Равно("""На удаление 280218""");

КонецПроцедуры	

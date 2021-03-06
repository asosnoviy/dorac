#Использовать asserts
#Использовать "./../"
#Использовать moskito
#Использовать logos

Перем Лог;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	ВсеТесты = Новый Массив;

	ВсеТесты.Добавить("ТестДолжен_РазобратьВыводМассив");
	ВсеТесты.Добавить("ТестДолжен_РазобратьВыводСтруктура");

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

Процедура ТестДолжен_РазобратьВыводМассив() Экспорт

	Вывод = "infobase : 09559b25-9c50-4d35-aace-635276577e65
	|name     : UH_DEV5
	|descr    :
	|
	|infobase : f6f3228d-83d0-47f4-84b0-3c4fe91d3e72
	|name     : UH_Osipov
	|descr    : На удаление 280218";

	РазобранныйВывод = РаботаСВыводом.РазобратьВывод(Вывод, Перечисления.ТипЗначения.Массив);

	Ожидаем.Что(ТипЗнч(РазобранныйВывод)).Равно(Тип("Массив"));
	Ожидаем.Что(РазобранныйВывод[0].name).Равно("UH_DEV5");
	Ожидаем.Что(РазобранныйВывод[1].descr).Равно("На удаление 280218");

КонецПроцедуры	

Процедура ТестДолжен_РазобратьВыводСтруктура() Экспорт

	Вывод = "infobase : f6f3228d-83d0-47f4-84b0-3c4fe91d3e72
	|	name     : UH_Osipov
	|	descr    : ""На удаление 280218""
	|
	|";

	РазобранныйВывод = РаботаСВыводом.РазобратьВывод(Вывод, Перечисления.ТипЗначения.Структура);

	Ожидаем.Что(РазобранныйВывод).ИмеетТип(Тип("Структура"));
	Ожидаем.Что(РазобранныйВывод.name).Равно("UH_Osipov");
	Ожидаем.Что(РазобранныйВывод.descr).Равно("""На удаление 280218""");

КонецПроцедуры	

#Использовать asserts
#Использовать "./../"
#Использовать moskito
#Использовать logos

Перем Лог;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	ВсеТесты = Новый Массив;
	
	Если НЕ ЗначениеЗаполнено(ПолучитьПеременнуюСреды("realtest")) Тогда
		Возврат ВсеТесты;
	КонецЕсли;	

	ВсеТесты.Добавить("ТестДолжен_ПроверитьПоЧестномуsummery");

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

Процедура ТестДолжен_ПроверитьПоЧестномуsummery() Экспорт

	Дурак = Новый Дурак("C:\Program Files\1cv8\8.3.12.1412\bin\rac.exe");
	РеальныйКластерid = "9ad134c4-890f-4c53-95f8-49f7f3f1143e";
	
	СписокБаз = Дурак.infobase(РеальныйКластерid).summary().list();
	Ожидаем.Что(СписокБаз.Количество()).Больше(0);
	Ожидаем.Что(СписокБаз).ИмеетТип(Тип("Массив"));

	КакаятоРеальнаяБаза = СписокБаз[3];

	МертвыйКластерId = "9ad134c4-890f-4c53-95f8-49f7f3f1143r";
	СписокБаз = Дурак.infobase(МертвыйКластерId).summary().list();
	Ожидаем.Что(СписокБаз.Количество()).Равно(0);

	ИнформацияПоБазе = Дурак.infobase(РеальныйКластерid).summary().info(КакаятоРеальнаяБаза.infobase);
	Ожидаем.Что(ИнформацияПоБазе.Количество()).Равно(3);
	Ожидаем.Что(ИнформацияПоБазе).ИмеетТип(Тип("Структура"));
	
	Лог.Отладка(МертвыйКластерId);
	
	ИнформацияПоБазе = Дурак.infobase(МертвыйКластерId).summary().info(КакаятоРеальнаяБаза);
	Ожидаем.Что(ИнформацияПоБазе.Количество()).Равно(0);
	// fix me
	// Ожидаем.Что(ИнформацияПоБазе).ИмеетТип(Тип("Структура"));

КонецПроцедуры	
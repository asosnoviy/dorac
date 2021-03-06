Перем Исполнитель;
Перем infobase;
Перем Параметры;

Процедура ПриСозданииОбъекта(ПутьКРак = "")

	Исполнитель = Новый ИсполнительКоманд(ПутьКРак);
	Параметры = Новый Соответствие;

КонецПроцедуры


Функция infobase(cluster, cluster_user = "", cluster_pwd = "") Экспорт

	Параметры.Вставить("cluster", cluster);
	Параметры.Вставить("cluster-user", cluster_user);
	Параметры.Вставить("cluster-pwd", cluster_pwd);
	
	infobase = Новый infobase(Параметры, Исполнитель);

	Возврат infobase;
	
КонецФункции	

Процедура УстановитьИсполнитель(ВхИсполнитель)

	Исполнитель = ВхИсполнитель;

КонецПроцедуры	


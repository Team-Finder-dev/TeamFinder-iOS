# Стек

- Moya;
- Kingfisher;
- Swinject DI;
- SwiftLint;
- SwiftGen для автоматической генерации ресурсов;
- Swift Package Manager (SPM);
- Архитектура приложения: MVP + Coordinator;
- Минимальная версия операционной системы: iOS 14.

# Merge requests & commits

Есть две ветки:

- release
- develop

Основная работа ведется с веткой develop. От нее отводим свои ветки feature/bugfix, в нее же и вливаем.


**Пример создания ветки фичи:** <br>
feature/фамилия/TFN-1-что-сделал-кратко

**Пример создания ветки фикса бага:** <br>
bugfix/фамилия/TFN-1-что-сделал-кратко

Номер (TFN-*номер*) привязывается к номеру issue.

Коммиты пишутся на русском языке.

**Пример:** <br>
[TFN-1] - Поправил баг/ Добавил фичу, которая делает что-то

Перед влитием в ветку **develop**, необходимо подтянуть её в свою ветку, чтобы проверить наличие конфликтов перед слиянием.


# CodeStyle

## Функция, имеющая больше двух параметров переносится на новую строку

**Пример:** <br>
func set(str: String, str: String) -> Int

func set( <br>
    str: String, <br>
    str: String, <br>
    str: String <br>
) -> Int

## Перенос скобок

**Пример:** <br>
let model = Model( <br>
set1, <br>
set2 <br>
)

## Нейминг функций / свойств

- func setup*Название*() - Настройка, что вызовется единожды

- func configure*Название*() - Переиспользование

- func get*Название*() / func fetch*Название* - Получение запроса

- func handle*Название*() - Обработка

- func map*Название*() - Маппинг из одного в другое

- func is*Название*() -> Bool - Функция, возвращающая bool

## Отступы

В классах и расширениях используется дополнительная пустая строка.
В структурах, функциях и протоколах отступ не нужен.

**Пример:** <br>
class A {

func set() {}

}

extension A {

func set() {}

}

struct A { <br>
func set() {} <br>
}

Все константы выносятся в отдельный enum.

**Пример:** <br>
class A {

enum Constants {
    static let num = 1
}

}

## Разделение по MARK

- Constants;
- Public Properties;
- Internal Properties;
- Private Properties;
- Initializers;
- Public Methods;
- Internal Methods;
- Private Methods.

**Пример:** <br>
class A { <br>
// MARK: - Constants <br>
// MARK: - Initializers <br>
}

## Комментарии

Комментарии пишем по возможности на свойства / функции, но если логика названия свойста или функции простая и понятная, то комментарий можно не писать.

**Пример:** <br>
/// Проверка на валидацию <br>
var isValid: Bool

## Дополнительные сведения

Использование **self** без необходимости стараемся избегать.

По возможности используем SOLID, DRY, KISS и YAGNI.

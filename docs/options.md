# Настройки и примеры UniversalSynSaveInstance

Основано на [документации USSI](https://rbxlx.github.io/UniversalSynSaveInstance/api/SynSaveInstance/) и сверено с `saveinstance.luau` в этом репозитории. Онлайн-документация может описывать другую версию; здесь перечислены параметры, поддерживаемые нашей копией. Названия параметров не зависят от регистра, неизвестные параметры игнорируются.

В `run.luau` можно отредактировать таблицу `options`. Строка с `--` — комментарий: удалите `--`, чтобы включить параметр. Не пишите один параметр дважды. Примеры ниже — отдельные варианты вызова после загрузки `synsaveinstance`, а не команды чата.

## Режимы и файл

| Параметр | Что делает | Значение по умолчанию |
|---|---|---|
| `mode` | `"full"` — доступная структура игры; `"optimized"` — основные сервисы; `"scripts"` — ветви верхнего уровня, содержащие скрипты; другое значение — только `ExtraInstances` и `Object`. | `"optimized"` |
| `Binary` | `true` — бинарный `.rbxl`/`.rbxm`, `false` — XML `.rbxlx`/`.rbxmx`. Среда с неисправной записью может переключиться на XML. | `true` |
| `CompressionMode` | Сжатие бинарного файла: `"zstd"`, `"lz4"` или `false`. `true` означает `"zstd"`. | `"zstd"` |
| `CompressionLevel` | Уровень zstd от -7 до 22; для lz4 не применяется. | `9` |
| `FilePath` | Имя или путь результата; без расширения оно добавляется автоматически. Явный путь перезаписывает существующий файл. | `false` |
| `AvoidFileOverwrite` | Добавляет номер к автоматически выбранному имени; не работает при заданном `FilePath`. | `true` |
| `Object` | Сохранить указанный объект вместе с потомками; по умолчанию получится модель. Передавайте Instance, не строку. | `false` |
| `IsModel` | Формат модели вместо файла места; для `Object` обычно включается автоматически. | `false` |
| `ExtraInstances` | Список дополнительных объектов; при невалидном `mode` сохраняются только они и `Object`. | `{}` |

## Скрипты и содержимое

| Параметр | Что делает | Значение по умолчанию |
|---|---|---|
| `Decompile` | Пытается восстановить исходный текст доступных скриптов. | `true` |
| `DecompileTimeout` | Таймаут одного вызова декомпилятора в секундах; `-1` отключает его и может зависнуть. | `10` |
| `scriptcache` | Кэшировать декомпилированный текст при наличии `getscriptbytecode`. | `true` |
| `SaveBytecode` | Добавлять байткод в комментарий к исходнику, если среда поддерживает `getscriptbytecode`. | `false` |
| `BytecodeTimeout` | Таймаут чтения байткода в секундах; `-1` отключает его. | `3` |
| `DecompileIgnore` | Не декомпилировать выбранные объекты и потомков. Например, `{ "TextChatService" }`. | `{ "TextChatService" }` |
| `RecoverScriptsFromAssets` | Пытаться получить исходник опубликованных ассетов; он может отличаться от текущей версии игры. | `true` |
| `NilInstances` | Включать объекты без родителя, если доступен `getnilinstances`. | `false` |
| `IgnoreNotArchivable` | Включать объекты с `Archivable = false`. | `true` |
| `SaveNotCreatable` | Заменять некоторые несоздаваемые классы доступными, часто папками. | `false` |
| `IgnoreList` | Пропускать указанные объекты/классы; `Packages = false` оставляет объект, но пропускает его потомков. | `{ "CoreGui", "CorePackages", Packages = false }` |
| `IgnoreProperties` | Не сохранять свойства с указанными именами, например `{ "Tags" }`. | `{}` |
| `IgnoreDefaultProperties` | Пропускать свойства по умолчанию; влияет только на XML. | `true` |
| `IgnoreSpecialProperties` | Не использовать `gethiddenproperty`; другие методы чтения могут применяться. | `false` |
| `SavePlayerCharacters` | Сохранять персонажей игроков; также включает сохранение объектов с `Archivable = false`. | `false` |
| `IsolatePlayers` | Поместить игроков в отдельную папку `Players`. | `false` |
| `IsolateLocalPlayer` | Сохранить локального игрока как отдельную папку; игнорируется при `IsolatePlayers = true`. | `false` |
| `IsolateStarterPlayer` | Вынести содержимое `StarterPlayer` в отдельную папку. | `false` |

## Работа и диагностика

| Параметр | Что делает | Значение по умолчанию |
|---|---|---|
| `SafeMode` | Отключает локального игрока от игры перед сохранением; если не заданы отдельно, включает `KillAllScripts` и `BoostFPS`. Не гарантирует защиту от обнаружения. | `false` |
| `KillAllScripts` | Пытается остановить другие скрипты; может нарушить работу игры. | `false` |
| `BoostFPS` | Временно отключает 3D-рендеринг. | `false` |
| `AntiIdle` | Пытается предотвратить отключение за бездействие. | `true` |
| `ShowStatus` | Показывает статус сохранения. | `true` |
| `ReadMe` | Добавляет в сохранение скрипт с информацией и предупреждениями. | `true` |
| `AlternativeWritefile` | Записывает результат частями через `appendfile`, если доступно. | `true` |
| `CopyToClipboard` | Копирует результат вместо записи файла; нужен `setrbxclipboard`, подходит для небольших сохранений. | `false` |
| `Callback` | Функция `function(data, chunks) ... end`, получает результат вместо записи файла. При `CopyToClipboard = true` приоритет у буфера обмена. | `false` |
| `__DEBUG_MODE` | Дополнительные предупреждения; также можно передать функцию для их обработки. | `false` |
| `ShutdownWhenDone` | Закрывает игру после успешного сохранения. | `false` |

`run.luau` намеренно задаёт некоторые значения иначе, чем настройки по умолчанию в таблицах выше. Параметры `IgnoreSharedStrings`, `SharedStringOverwrite` и `decomptype`, встречающиеся в старой онлайн-документации, в нашей версии не поддерживаются.

## Примеры

Вставьте загрузку один раз перед выбранным примером:

```luau
local url = "https://raw.githubusercontent.com/Xenon150/Universal/refs/heads/main/"
local synsaveinstance = loadstring(game:HttpGet(url .. "saveinstance.luau", true), "saveinstance")()
```

Только ветви с доступными скриптами (не обязательно только сами скрипты):

```luau
synsaveinstance({ mode = "scripts", Decompile = true, DecompileTimeout = 15 })
```

XML с явно заданным именем (существующий файл будет перезаписан):

```luau
synsaveinstance({ mode = "full", Binary = false, FilePath = "my-place.rbxlx" })
```

Отдельная модель вместе с потомками. Замените `MyModel` на имя существующей модели:

```luau
local model = workspace:WaitForChild("MyModel")
synsaveinstance({ Object = model, FilePath = "my-model.rbxm" })
```

Только выбранные объекты (без остальных объектов места):

```luau
local model = workspace:WaitForChild("MyModel")
synsaveinstance({ mode = "invalid", ExtraInstances = { model }, IsModel = true })
```

Сохраняйте только проекты, на которые у вас есть разрешение. Даже `full` не получает серверные данные, недоступные клиенту, и не гарантирует успешную декомпиляцию. Результат остаётся в файловой области среды выполнения и автоматически на GitHub не отправляется.

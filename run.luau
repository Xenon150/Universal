local repoURL = "https://raw.githubusercontent.com/Xenon150/Universal/refs/heads/main/"
local synsaveinstance = loadstring(game:HttpGet(repoURL .. "saveinstance.luau", true), "saveinstance")()

local options = {
    -- Что сохранять:
    -- "full"      — доступную клиенту структуру игры.
    -- "optimized" — основные сервисы.
    -- "scripts"   — ветви, содержащие скрипты.
    mode = "full",

    -- true отключает игрока от игры перед сохранением.
    -- Если KillAllScripts и BoostFPS не заданы отдельно,
    -- SafeMode также включает их. Это НЕ гарантия от обнаружения.
    SafeMode = false,

    -- true пытается остановить другие работающие скрипты.
    -- Может нарушить работу игры. Здесь явно выключено,
    -- поэтому SafeMode не включит его автоматически.
    KillAllScripts = false,

    -- true пытается предотвратить отключение за бездействие.
    AntiIdle = true,

    -- true пытается восстановить исходный код доступных скриптов.
    -- Нужен поддерживаемый декомпилятор.
    Decompile = true,

    -- Максимальное ожидание одного вызова декомпилятора в секундах.
    -- -1 отключает таймаут, но сохранение может зависнуть.
    DecompileTimeout = -1,

    -- true сохраняет результаты декомпиляции в кэш.
    -- false пытается декомпилировать скрипты заново.
    scriptcache = false,

    -- true включает объекты без родителя, если среда
    -- поддерживает функцию getnilinstances.
    NilInstances = true,

    -- true сохраняет и объекты с Archivable = false.
    IgnoreNotArchivable = true,

    -- true пропускает стандартные значения свойств.
    -- Этот параметр влияет только на XML, не на бинарный файл.
    IgnoreDefaultProperties = false,

    -- true не использует gethiddenproperty; другие способы
    -- чтения свойств при этом могут продолжать работать.
    IgnoreSpecialProperties = false,

    -- true помещает игроков в отдельную папку Players.
    IsolatePlayers = false,

    -- true сохраняет локального игрока в отдельной папке.
    -- Игнорируется, если IsolatePlayers = true.
    IsolateLocalPlayer = false,

    -- true включает персонажей игроков в сохранение.
    SavePlayerCharacters = true,

    -- true заменяет некоторые несоздаваемые классы доступными,
    -- обычно папками. Это не сохраняет все их свойства.
    SaveNotCreatable = true,

    -- Дополнительные настройки:
    -- Чтобы использовать строку, уберите перед ней два дефиса.

    -- false сохраняет XML (.rbxlx); true — бинарный .rbxl.
    -- Binary = false,

    -- Сжатие бинарного файла: "zstd", "lz4" или false.
    -- CompressionMode = "lz4",

    -- Уровень сжатия zstd от -7 до 22.
    -- К lz4 не применяется.
    -- CompressionLevel = 9,

    -- Имя файла. Существующий файл с этим именем перезапишется.
    -- FilePath = "my-place",

    -- true добавляет байткод в комментарий к исходнику,
    -- если среда поддерживает getscriptbytecode.
    -- SaveBytecode = true,

    -- Время ожидания чтения байткода в секундах.
    -- -1 отключает таймаут.
    -- BytecodeTimeout = 3,

    -- Не декомпилировать выбранные объекты и их потомков.
    -- DecompileIgnore = { "TextChatService" },

    -- Какие объекты пропускать при сохранении.
    -- Packages = false оставляет объект Packages,
    -- но пропускает его потомков.
    -- IgnoreList = { "CoreGui", "CorePackages", Packages = false },

    -- Не сохранять свойства с перечисленными именами.
    -- IgnoreProperties = { "Tags" },

    -- Вынести содержимое StarterPlayer в отдельную папку.
    -- IsolateStarterPlayer = true,

    -- Временно отключить 3D-рендеринг во время сохранения.
    -- BoostFPS = true,

    -- Показывать статус сохранения на экране.
    -- ShowStatus = true,

    -- Добавить в результат README с информацией и предупреждениями.
    -- ReadMe = true,

    -- Выводить дополнительные предупреждения для диагностики.
    -- __DEBUG_MODE = true,
}

local path = synsaveinstance(options)
print("Сохранение завершено:", path)

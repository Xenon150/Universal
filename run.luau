-- Запускайте только для проектов, которые вам разрешено сохранять.
local repoURL = "https://raw.githubusercontent.com/Xenon150/Universal/refs/heads/main/"
local synsaveinstance = loadstring(game:HttpGet(repoURL .. "saveinstance.luau", true), "saveinstance")()

local options = {
	mode = "full",
	SafeMode = false,
	KillAllScripts = false,
	AntiIdle = true,
	Decompile = true,
	DecompileTimeout = -1,
	scriptcache = false,
	NilInstances = true,
	IgnoreNotArchivable = true,
	IgnoreDefaultProperties = false,
	IgnoreSpecialProperties = false, -- true отключает gethiddenproperty
	IsolatePlayers = false,
	IsolateLocalPlayer = false,
	SavePlayerCharacters = true,
	SaveNotCreatable = true,

	-- Дополнительные настройки: уберите -- у нужной строки.
	-- Binary = false,                 -- XML (.rbxlx), вместо бинарного .rbxl
	-- CompressionMode = "lz4",        -- "zstd", "lz4" или false; только для бинарного файла
	-- CompressionLevel = 9,           -- уровень zstd от -7 до 22
	-- FilePath = "my-place",          -- перезапишет существующий файл с этим именем
	-- SaveBytecode = true,            -- байткод в комментарии, если среда поддерживает
	-- BytecodeTimeout = 3,            -- секунды; -1 отключает таймаут
	-- DecompileIgnore = { "TextChatService" }, -- пропустить декомпиляцию выбранных объектов
	-- IgnoreList = { "CoreGui", "CorePackages", Packages = false }, -- пропустить объекты
	-- IgnoreProperties = { "Tags" },  -- не сохранять указанные свойства
	-- IsolatePlayers = true,          -- вынести игроков в отдельную папку
	-- IsolateStarterPlayer = true,    -- вынести содержимое StarterPlayer в папку
	-- ShowStatus = true,              -- показывать статус сохранения
	-- ReadMe = true,                  -- добавить сведения в сохраняемый файл
	-- __DEBUG_MODE = true,            -- выводить дополнительные предупреждения
}

local path = synsaveinstance(options)
print("Сохранение завершено:", path)

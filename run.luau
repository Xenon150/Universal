-- Запускайте только для проектов, которые вам разрешено сохранять.
local repoURL = "https://raw.githubusercontent.com/Xenon150/Universal/refs/heads/arena/faa1ad33-universal/"
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
	IgnoreSpecialProperties = false,
	IsolatePlayers = false,
	IsolateLocalPlayer = false,
	SavePlayerCharacters = true,
	SaveNotCreatable = true,
}

local path = synsaveinstance(options)
print("Сохранение завершено:", path)

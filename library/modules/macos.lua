---@meta
---[builtin modules](https://xmake.io/#/manual/builtin_modules)

--- @class xmake.macos
macos = {}

--- Get macOS system version
---
--- The version returned is the semver semantic version object
---
--- @example
--- ```lua
--- if macos.version():ge("10.0") then
---     - ...
--- end
--- ```
--- @endexample
---
--- @return xmake.version #macos version
function macos.version() end

---@meta
---[builtin modules](https://xmake.io/#/manual/builtin_modules)

--- @class xmake.winos
winos = {}

--- Get windows system version
---
--- The version returned is the semver semantic version object
---
--- @example
--- ```lua
--- if winos.version():ge("win7") then
---     - ...
--- end
--- 
--- if winos.version():ge("6.1") then
---     - ...
--- end
--- ```
--- @endexample
---
--- In addition, it can also support the direct judgment of the windows version name. The mapping rules are as follows:
--- ```
--- nt4 = "4.0"
--- win2k = "5.0"
--- winxp = "5.1"
--- ws03 = "5.2"
--- win6 = "6.0"
--- vista = "6.0"
--- ws08 = "6.0"
--- longhorn = "6.0"
--- win7 = "6.1"
--- win8 = "6.2"
--- winblue = "6.3"
--- win81 = "6.3"
--- win10 = "10.0"
--- ```
---
--- @return xmake.version #windows version
function winos.version() end

--- Get registry key paths
---
--- Support through pattern matching, traverse to obtain the registry key path list, * is single-level path matching, ** is recursive path matching.
---
--- @example
--- ```lua
--- local keys, errors = winos.registry_keys("HKEY_LOCAL_MACHINE\\SOFTWARE\\*\\Windows NT\\*\\CurrentVersion\\AeDebug")
--- local keys, errors = winos.registry_keys("HKEY_LOCAL_MACHINE\\SOFTWARE\\**")
--- ```
---
--- ```lua
--- local keypaths = winos.registry_keys("HKEY_LOCAL_MACHINE\\SOFTWARE\\*\\Windows NT\\*\\CurrentVersion\\AeDebug")
---  for _, keypath in ipairs(keypaths) do
---     print(winos.registry_query(keypath .. ";Debugger"))
--- end
--- ```
--- @endexample
---
--- @param keypath string the key path (support key pattern, e.g. \\a\\b;xx*yy)
--- @return string[] #the keys
--- @return number #the error code
function winos.registry_keys(keypath) end

--- Get a list of registry value names
---
--- Support to obtain the value name list of the specified key path through pattern matching,
--- and the string after the ; is the specified key name pattern matching string.
---
--- @example
--- ```lua
--- local values, errors = winos.registry_values("HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug")
--- local values, errors = winos.registry_values("HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug;Debug*")
--- ```
---
--- ```lua
--- local valuepaths = winos.registry_values("HKEY_LOCAL_MACHINE\\SOFTWARE\\xx\\AeDebug;Debug*")
--- for _, valuepath in ipairs(valuepaths) do
---     print(winos.registry_query(valuepath))
--- end
--- ```
--- @endexample
---
--- @param keypath string the key path (support value pattern, e.g. \\a\\b;xx*yy)
--- @return string[] #the values
--- @return number #the error code
function winos.registry_values(keypath) end

--- Get the registry value
---
--- Get the value under the specified registry path, if the value name is not specified, then get the default value of the key path
---
--- @example
--- ```lua
--- local value, errors = winos.registry_query("HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug")
--- local value, errors = winos.registry_query("HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug;Debugger")
--- ```
--- @endexample
---
--- @param keypath string the key path
--- @return string[] #the values
--- @return number #the error code
function winos.registry_query(keypath) end

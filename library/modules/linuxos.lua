---@meta
---[builtin modules](https://xmake.io/#/manual/builtin_modules)

--- @class xmake.linuxos
linuxos = {}

--- Get linux system name
---
--- We can also quickly get the view through the following command
--- ```bash
--- xmake l linuxos.name
--- ```
---
--- @return "ubuntu"|"debian"|"archlinux"|"manjaro"|"linuxmint"|"centos"|"fedora"|"opensuse"|string
function linuxos.name() end

--- Get linux system version
---
--- The version returned is the semver semantic version object
---
--- @example
--- ```lua
--- if linux.version():ge("10.0") then
---     -- ...
--- end
--- ```
--- @endexample
---
--- @return xmake.version #semver semantic version object
function linuxos.version() end

--- Get linux system kernel version
---
--- What is returned is also a semantic version object, you can also execute `xmake l linuxos.kernelver` to quickly view
---
--- @return xmake.version #semver semantic version object
function linuxos.kernelver() end

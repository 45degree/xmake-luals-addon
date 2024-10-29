---@meta

--- @class xmake.config
---
--- Extension Module: `core.config.config`
---
config = {}

--- Get the specified configuration value
---
--- Extension Module: `core.config.config`
---
--- Used to get the configuration value of `xmake f|config --xxx=val`, for example:
---
--- @example
--- ```lua
--- target("test")
--- on_run(function (target)
---     -- Import configuration module
---     import("core.project.config")
---
---     -- Get configuration values
---     print(config.get("xxx"))
--- end)
--- ```
--- @endexample
---
--- @param name string the configuration name
--- @return string #the configuration value
function config.get(name) end

--- Load configuration
---
--- Extension Module: `core.config.config`
---
--- Generally used in plug-in development, the plug-in task is not like the custom script of the project,
--- the environment needs to be initialized and loaded by itself,
--- the default project configuration is not loaded.
---
--- @example
---
--- if you want to use config.get interface to get the project Configuration, then you need to:
---
--- ```lua
--- -- Import configuration module
--- import("core.project.config")
---
--- function main(...)
---
---     -- Load project configuration first
---     config.load()
---
---     -- Get configuration values
---     print(config.get("xxx"))
--- end
--- ```
--- @endexample
function config.load() end

--- Get the schema configuration of the current project
---
--- Extension Module: `core.config.config`
---
--- That is to get the platform configuration of `xmake f|config --arch=armv7`,
--- which is equivalent to `config.get("arch")`.
---
--- @return string #the architecture value
function config.arch() end

--- Get the platform configuration of the current project
---
--- Extension Module: `core.config.config`
---
--- That is to get the platform configuration of `xmake f|config --plat=iphoneos`,
--- which is equivalent to `config.get("plat")`.
---
--- @return string #the platform value
function config.plat() end

--- Get the compilation mode configuration of the current project
---
--- Extension Module: `core.config.config`
---
--- That is to get the platform configuration of `xmake f|config --mode=debug`,
--- which is equivalent to `config.get("mode")`.
---
--- @return string #the compilation mode
function config.mode() end

--- Get the output directory configuration of the current project
---
--- Extension Module: `core.config.config`
---
--- That is to get the platform configuration of `xmake f|config -o /tmp/output`,
--- which is equivalent to `config.get("buildir")`.
---
--- @return string #the output directory
function config.buildir() end

--- Get the configuration information directory of the current project
---
--- Extension Module: `core.config.config`
---
--- Get the storage directory of the project configuration, the default is: `projectdir/.config`
---
--- @return string #the configuration information directory
function config.directory() end

--- Print out all configuration information of the current project
---
--- Extension Module: `core.config.config`
---
--- @example
--- The output is for example:
---
--- ``` lua
--- {
---     sh = "xcrun -sdk macosx clang++"
--- ,   xcode_dir = "/Applications/Xcode.app"
--- ,   ar = "xcrun -sdk macosx ar"
--- ,   small = true
--- ,   object = false
--- ,   arch = "x86_64"
--- ,   xcode_sdkver = "10.12"
--- ,   ex = "xcrun -sdk macosx ar"
--- ,   cc = "xcrun -sdk macosx clang"
--- ,   rc = "rustc"
--- ,   plat = "macosx"
--- ,   micro = false
--- ,   host = "macosx"
--- ,   as = "xcrun -sdk macosx clang"
--- ,   dc = "dmd"
--- ,   gc = "go"
--- ,   openssl = false
--- ,   ccache = "ccache"
--- ,   cxx = "xcrun -sdk macosx clang"
--- ,   sc = "xcrun -sdk macosx swiftc"
--- ,   mm = "xcrun -sdk macosx clang"
--- ,   buildir = "build"
--- ,   mxx = "xcrun -sdk macosx clang++"
--- ,   ld = "xcrun -sdk macosx clang++"
--- ,   mode = "release"
--- ,   kind = "static"
--- }
--- ```
--- @endexample
---
--- @return string #the configuration information
function config.dump() end

---@meta
---[target_instance](https://xmake.io/#/manual/target_instance)

---@class Target
local Target = {}

---
---Get the name of the target
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetname)
---
---@return string
function Target:name() end

---
---Get the values of the target by name
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetget)
---
---@param key string Key
---@return any
function Target:get(key) end

---
---Set the values of the target by name (If you just want to add values use [target:add](#targetadd))
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetset)
---
---@param key string Key
---@param ... any Value
---@return nil
function Target:set(key, ...) end

---
---Add to the values of the target by name
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetadd)
---
---@param key string Key
---@param ... any Value
---@return nil
function Target:add(key, ...) end

---
---Get the target program type
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetkind)
---
---@return TargetKind
function Target:kind() end

---
---Whether the current platform is one of the given platforms
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetis_plat)
---
---@param platform Platform Platform name
---@param ... Platform Platform names
---@return boolean
function Target:is_plat(platform, ...) end

---
--- Is the current architecture one of the given architectures
---
--- [Open in browser](https://xmake.io/#/manual/target_instance?id=targetis_arch)
---
--- @param arch Architecture Architecture name
--- @param ... Architecture Architecture names
--- @return boolean
function Target:is_arch(arch, ...) end

---
--- Get the target file path
---
--- [Open in browser](https://xmake.io/#/manual/target_instance?id=targettargetfile)
---
--- @return string
function Target:targetfile() end

---
---Get the output directory of the target file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targettargetdir)
---
---@return string
function Target:targetdir() end

---
---Get the base name of the target file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetbasename)
---
---@return string
function Target:basename() end

---
---Get the target file name
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetfilename)
---
---@return string
function Target:filename() end

---
---Get the installation directory of the target file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetinstalldir)
---
---@param path? string|xmake.path subpath under install directory
---
---@return string
function Target:installdir(path) end

---
--- Get auto-generated catalog
---
--- [Open in browser](https://xmake.io/#/manual/target_instance?id=targetautogendir)
---
--- @return string
function Target:autogendir() end

---
--- Get the object file path
---
--- [Open in browser](https://xmake.io/#/manual/target_instance?id=targetobjectfile)
---
--- @param source string Source file name
--- @return string
function Target:objectfile(source) end

---
--- Get all source files
---
--- [Open in browser](https://xmake.io/#/manual/target_instance?id=targetsourcebatches)
---
--- It can get all the source files added by `add_files` and store them separately according to different source file types.
---
--- The approximate structure is as follows:
--- ```lua
--- {
---   "c++.build" = {
---     objectfiles = {
---       "build/.objs/test/macosx/x86_64/release/src/main.cpp.o"
---     },
---     rulename = "c++.build",
---     sourcekind = "cxx",
---     sourcefiles = {
---       "src/main.cpp"
---     },
---     dependfiles = {
---       "build/.deps/test/macosx/x86_64/release/src/main.cpp.o.d"
---     }
---   },
---   "asm.build" = {
---     objectfiles = {
---       "build/.objs/test/macosx/x86_64/release/src/test.S.o"
---     },
---     rulename = "asm.build",
---     sourcekind = "as",
---     sourcefiles = {
---       "src/test.S"
---     },
---     dependfiles = {
---       "build/.deps/test/macosx/x86_64/release/src/test.S.o.d"
---     }
---   }
--- }
--- ```
---
--- @example
--- We can traverse to obtain and process each type of source file.
---
--- ```lua
--- for _, sourcebatch in pairs(target:sourcebatches()) do
---     local sourcekind = sourcebatch.sourcekind
---     if sourcekind == "cc" or sourcekind == "cxx" or sourcekind == "as" then
---         for _, sourcefile in ipairs(sourcebatch.sourcefiles) do
---             - TODO
---         end
---     end
--- end
--- ```
---
--- Where sourcekind is the type of each source file, cc is the c file type, cxx is the c++ source file, and as is the asm source file.
--- sourcebatch corresponds to each type of source file batch, corresponding to a batch of source files of the same type.
--- sourcebatch.sourcefiles is a list of source files, sourcebatch.objectfiles is a list of object files,
--- and sourcebatch.rulename is the name of the corresponding rule.
--- @endexample
--- @see add_files
---
--- @return table<string, SourceBatch>
function Target:sourcebatches() end

---
--- Get a list of all object files
---
--- [Open in browser](https://xmake.io/#/manual/target_instance?id=targetobjectfiles)
---
--- Although `target:sourcebatches()` can also obtain all object files, they are classified according to the source file type and do not directly participate in the final link.
---
--- If we want to dynamically modify the final linked object file list, we can modify `target:objectfiles()`, which is an array list.
---
--- @return string[]
function Target:objectfiles() end

---
--- Get a list of extra files
---
--- [Open in browser](https://xmake.io/#/manual/target_instance?id=targetobjectfiles)
---
--- @return string[]
function Target:extrafiles() end

---
--- Get a list of all header files
---
--- [Open in browser](https://xmake.io/#/manual/target_instance?id=targetheaderfiles)
---
--- You can get a list of all header files set by the `add_headerfiles()` interface.
---
--- @example
--- ```lua
--- for _, headerfile in ipairs(target:headerfiles()) do
---     - TODO
--- end
--- ```
--- @endexample
---
--- @return string[]
function Target:headerfiles() end

---
---Get the xmake.lua directory where the target definition is located
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetscriptdir)
---
--- This is usually used in custom rules. If you want to get the directory where the current target is actually defined in xmake.lua,
--- it is convenient to reference some resource files. You can use this interface.
---
--- @return string
function Target:scriptdir() end

--- Check whether the target compilation configuration can obtain the given C++ function
---
--- The usage is similar to `target:has_cfuncs`, except that it is mainly used to detect C++ functions.
--- However, while detecting functions, we can also additionally configure std languages to assist detection.
---
--- @example
--- ```lua
--- target:has_cxxfuncs("foo", {includes = "foo.h", configs = {languages = "cxx17"}})
--- ```
--- @endexample
---
--- @param name string function name
--- @vararg table configs
--- @return boolean # true if the target can obtain the given C/C++ function
function Target:has_cxxfuncs(name, ...) end

--- Check whether the target compilation configuration can obtain the given C type
---
--- @example
--- This should be used in `on_config` like this:
--- ```lua
--- add_requires("zlib")
--- target("test")
---      set_kind("binary")
---      add_files("src/*.c")
---      add_packages("zlib")
---      on_config(function(target)
---          if target:has_ctypes("z_stream", {includes = "zlib.h"}) then
---              target:add("defines", "HAVE_ZSTEAM_T")
---          end
---      end)
--- ```
--- @endexample
---
--- @param name string function name
--- @vararg table configs
--- @return boolean # true if the target can obtain the given C type
function Target:has_ctypes(name, ...) end

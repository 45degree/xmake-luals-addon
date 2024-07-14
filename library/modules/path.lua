---@meta
---[builtin modules](https://xmake.io/#/manual/builtin_modules)

---@class xmake.path
path = {}

--- 
--- Create a new path instance
---
--- @param path string
--- @return xmake.path
function path.new(path) end

---
--- Stitching Path
--- 
--- @param path string|xmake.path path
--- @vararg string|xmake.path
--- @return string
function path.join(path, ...) end

---
--- Convert path to the path style of the current platform
---
--- @param path string|xmake.path path
--- @return string
function path.translate(path) end

---
--- Get the file name with no suffix at the end
---
--- @param path string|xmake.path path
--- @return string
function path.basename(path) end

---
--- Get the file name with the last suffix of the path
---
--- @param path string|xmake.path file path
--- @return string
function path.filename(path) end

---
--- Get the suffix of the path
--- 
--- @param path string|xmake.path file path
--- @return string
function path.extension(path) end

---
--- Get the directory name of the path
---
--- @param path string|xmake.path file path
--- @return string
function path.directory(path) end

---
--- Convert to relative path
--- 
--- @param path string|xmake.path path
--- @param rootdir string|xmake.path? root dir
--- @return string
function path.relative(path, rootdir) end

---
--- Convert to absolute path
---
--- @param path string|xmake.path path
--- @param rootdir string|xmake.path? root dir
--- @return string
function path.absolute(path, rootdir) end

---
--- Determine if it is an absolute path
---
--- @param path string|xmake.path path
--- @return boolean
function path.is_absolute(path) end

---
--- Split by the separator
---
--- @param path string|xmake.path path
--- @return string[]
function path.split(path) end

---
--- Get the separator character
---
--- @param path string|xmake.path path
--- @return string
function path.sep(path) end

---
--- Get if the last character is a separator
--- 
--- @param path string|xmake.path path
--- @return boolean
function path.islastsep(path) end

---
--- Split a environment variable value of an array of paths
--- 
--- @param str string the path environment variable
--- @return string[]
function path.splitenv(str) end

---
--- Concat environment variable with environment separator
---
--- @param paths string[]|xmake.path[] paths
--- @return string
function path.joinenv(paths) end

---
--- Get the path separator of environment variable
--- 
--- @return string
function path.envsep() end

---
--- Get the converted MSYS2/Cygwin style path
---
--- @param path string|xmake.path[]
--- @return string
function path.cygwin_path(path) end

---
--- Convert a path pattern to a lua pattern
--- 
--- @param path string|xmake.path[]
--- @return string
function path.pattern(path) end

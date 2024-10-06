---@meta
---[builtin modules](https://xmake.io/#/manual/builtin_modules)

--- @class xmake.os
os = {}

---
--- Copy files or directories
---
--- @param src string|xmake.path src path
--- @param dst string|xmake.path dst path
--- @vararg any config
--- @return nil
function os.cp(src, dst, ...) end

---
--- Move to rename a file or directory
---
--- @param src string|xmake.path src path
--- @param dst string|xmake.path dst path
--- @vararg any config
--- @return nil
function os.mv(src, dst, ...) end

---
--- Delete files or directory trees
---
--- @param path string|xmake.path path
--- @vararg any config
--- @return nil
function os.rm(path, ...) end

---
--- Try copying files or directories
---
--- @param src string|xmake.path src path
--- @param dst string|xmake.path dst path
--- @vararg any config
--- @return boolean
function os.trycp(src, dst, ...) end

---
--- Try moving a file or directory
---
--- @param src string|xmake.path src path
--- @param dst string|xmake.path dst path
--- @vararg any config
--- @return boolean
function os.trymv(src, dst, ...) end

---
--- Try deleting files or directories
---
--- @param path string|xmake.path path
--- @vararg any config
--- @return boolean
function os.tryrm(path, ...) end

---
--- Enter the specified directory
---
--- @param path string|xmake.path path
--- @return string path old path
function os.cd(path) end

---
--- delete only the directory, If it is not a directory, it cannot be deleted.
---
--- @param path string|xmake.path path
--- @return nil
function os.rmdir(path) end

---
--- Create a directory
---
--- @param path string|xmake.path directory
--- @vararg string other directory
--- @return boolean
function os.mkdir(path, ...) end

---
--- Determine if it is a directory
---
--- @param path string|xmake.path directory
--- @return boolean
function os.isdir(path) end

---
--- Determine if it is a file
---
--- @param path string|xmake.path file path
--- @return boolean
function os.isfile(path) end

---
--- Determine if a file or directory exists
---
--- @param path string|xmake.path path
--- @return boolean
function os.exists(path) end

---
--- Traversing to get all directories under the specified directory
---
--- @param path string|xmake.path path
--- @return string[]
function os.dirs(path) end

---
---	Traversing to get all the files in the specified directory
---
--- @param path string|xmake.path path
--- @return string[]
function os.files(path) end

---
--- Traversing to get all files or directories under the specified directory
---
--- @param path string|xmake.path path
--- @return string[]
function os.filedirs(path) end

---
--- Exit the program
---
function os.exit() end

---
--- Test if a file is executable
---
--- @param path string|xmake.path file path
--- @return boolean
function os.isexec(path) end

---
--- Quiet running program
---
--- @param str string format command string
--- @vararg any
function os.run(str, ...) end

---
---	Quiet running program with parameter list
---
--- @param program string command string
--- @param argv string[] command parameters
--- @param opts any options
function os.runv(program, argv, opts) end

---
---	Evoke Run Program
---
--- @param program string format command string
--- @vararg any
function os.exec(program, ...) end

---
---	Echo running program with parameter list
---
--- @param program string command string
--- @param argv string[] command parameters
--- @param opts any options
function os.execv(program, argv, opts) end

---
--- Quietly running native shell commands and getting output
---
--- Similar to the `os.run` interface, the only difference is that after executing the shell program,
--- this interface will get the execution result of the shell program, which is equivalent to redirecting the output.
---
--- You can get the contents of stdout, stderr at the same time
--- 
--- @example
--- ```lua
--- local outdata, errdata = os.iorun("echo hello xmake!")
--- ```
--- @endexample
---
--- @param program string format command string
--- @param opt? table options
--- @return string # content of stdout
--- @return string # content of stderr
function os.iorun(program, opt) end

---
--- Run the native shell command quietly and get the output with a list of parameters
---
--- Similar to `os.iorun`, just the way to pass arguments is passed through the argument list, not the string command
---
--- @example
--- ```lua
--- local outdata, errdata = os.iorunv("echo", {"hello", "xmake!"})
--- local outdata, errdata = os.iorunv("echo", {"hello", "xmake!"}, {envs = {PATH="..."}})
--- ```
--- @endexample
---
--- @param program string command string
--- @param argv string[] command parameters
--- @param opt? table options
--- @return string # content of stdout
--- @return string # content of stderr
function os.iorunv(program, argv, opt) end

---
---	Get Temp directory path
---
--- @return string
function os.tmpdir() end

---
---	Get Temporary File Path
---
--- @return string
function os.tmpfile() end

---
---	Get current directory path
---
--- @return string
function os.curdir() end

---
---	Get File Size
---
--- @param path string|xmake.path file path
--- @return number
function os.filesize(path) end

---
---	Get script directory path
---
--- @return string
function os.scriptdir() end

---
---	Get xmake install main program script directory
---
--- @return string
function os.programdir() end

---
---	Get the path of the xmake executable
---
--- @return string
function os.programfile() end

---
---	Get Project Home
---
--- @return string
function os.projectdir() end

---
---	Get Current System Architecture
---
--- @return Architecture
function os.arch() end

---
---	Get Current Host System
---
--- @return Host
function os.host() end

---
---	Get Subsystem host, e.g. msys, cygwin on windows
---
--- @return Subhost
function os.subhost() end

---
---	Get Subsystem host architecture
---
--- @return Subarchitecture
function os.subarch() end

---
---	Test if a given host is the current
---
--- @vararg Host hosts
--- @return boolean
function os.is_host(...) end

---
---	Test if a given arch is the current
---
--- @vararg Architecture architectures
--- @return boolean
function os.is_arch(...) end

---
---	Test if a given sub host is the current
---
--- @vararg Subhost subhosts
--- @return boolean
function os.is_subhost(...) end

---
---	Test if a given sub arch is the current
---
--- @vararg Subarchitecture Subarchitectures
--- @return boolean
function os.is_subarch(...) end

---
---	Link file or directory to the new symfile
---
--- @param srcpath string|xmake.path source path
--- @param dstpath string|xmake.path destination path
--- @param opt any
function os.ln(srcpath, dstpath, opt) end

---
---	Read the content of a symlink
---
--- @param symlink string|xmake.path symlink path
--- @return string
function os.readlink(symlink) end

---
---	Raise an exception and abort the current script
---
--- @param msg string message
--- @vararg any format arguments
function os.raise(msg, ...) end

---
---	Raise an exception and abort the current script
---
--- @param level number level
--- @param msg string message
--- @vararg any format arguments
function os.raiselevel(level, msg, ...) end

---
--- Get features
---
function os.features() end

--- @alias xmake.env_key string
--- @alias xmake.env_value string|number|xmake.path
--- @alias xmake.env table<xmake.env_key, xmake.env_value>

---
--- Get all current environment variables
---
--- @return xmake.env #environment variables
function os.getenvs() end

---
---	Set environment variables
---
--- @param envs xmake.env environment variables
function os.setenvs(envs) end

---
---	Add environment variables to current envs
---
--- @param envs xmake.env environment variables
function os.addenvs(envs) end

---
--- Join environment variables
---
--- @param envs xmake.env environment variables
--- @param old_envs xmake.env old environment variables
--- @return xmake.env
function os.joinenvs(envs, old_envs) end

---
--- Get Environment Variables
---
--- @param name xmake.env_key environment variable name
--- @return xmake.env_value environment variable value
function os.getenv(name) end

---
--- Setting environment variables
---
--- @param name xmake.env_key environment variable name
--- @param value xmake.env_value environment variable value
function os.setenv(name, value) end

---
---	Add values to one environment variable
---
--- @param name xmake.env_key environment variable name
--- @param value xmake.env_value environment variable value
function os.addenv(name, value) end

---
---	Setting environment variables with a given separator
---
--- @param name xmake.env_key environment variable name
--- @param values xmake.env_value[] environment variable values
--- @param sep string separator
--- @return boolean
function os.setenvp(name, values, sep) end

---
---	Add values to one environment variable with a given separator
---
--- @param name xmake.env_key environment variable name
--- @param values xmake.env_value[] environment variable values
--- @param sep string separator
--- @return boolean
function os.addenvp(name, values, sep) end

---
---	Get the working directory
---
--- @return string
function os.workingdir() end

---
---	Test if xmake is running as root
---
--- @return boolean
function os.isroot() end

---
---	Test if the os has a case sensitive filesystem
---
--- @param path string|xmake.path
--- @return boolean
function os.fscase(path) end

---
---	Get current terminal
---
--- @return string
function os.term() end

---
---	Get current shell
---
--- @return string
function os.shell() end

---
---	Get cpu information
---
--- @param name? "vendor"|"model"|"model_name"|"ncpu"|"family"|"usagerate"
--- @return table<string, string|number> | string | number
function os.cpuinfo(name) end

---
---	Get memory information
---
--- @param name? "availsize"|"totalsize"|"pagesize"|"usagerate"
--- @return table<string, number> | number
function os.meminfo(name) end

---
---	Get default paralled jobs
---
--- @return number #the default parallel jobs number
function os.default_njob() end

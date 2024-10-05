---@meta
---[builtin modules](https://xmake.io/#/manual/builtin_modules)

--- @class xmake.io.lock
lock = {}

--- lock file
function lock:lock() end

--- unlock file
function lock:unlock() end

--- close file
function lock:close() end

--- @class xmake.io
io = {}

---@class xmake.io.opts.open
---@field encoding "utf8"|"utf16"|"utf16le"|"utf16be"

---@class xmake.io.opts.replace : xmake.io.opts.open
---@field plain? boolean

--- Open file for reading and writing
---
--- This is a native interface for lua. For detailed usage, see Lua's official documentation: [The Complete I/O Model](https://www.lua.org/pil/21.2.html)
---
--- @example
--- If you want to read all the contents of the file, you can write:
--- ```lua
--- local file = io.open("$(tmpdir)/file.txt", "r")
--- if file then
---     local data = file:read("*all")
---     file:close()
--- end
--- ```
--- Or you can read it more quickly using `io.readfile`.
---
--- If you want to write a file, you can do this:
--- ```lua
--- -- Open file: w is write mode, a is append write mode
--- local file = io.open("xxx.txt", "w")
--- if file then
---
---     -- Write data to file with native lua interface, does not support formatting, no line breaks, does not support built-in variables
---     file:write("hello xmake\n")
---
---     -- Write data to file with xmake extended interface, support formatting, no line breaks, no built-in variables
---     file:writef("hello %s\n", "xmake")
---
---     -- Use xmake extended formatted parameters to write to one line, with line breaks, and support for built-in variables
---     file:print("hello %s and $(buildir)", "xmake")
---
---     -- Write a line using the xmake extended formatted arguments, no line breaks, and support for built-in variables
---     file:printf("hello %s and $(buildir) \n", "xmake")
---
---     -- Close the file
---     file:close()
--- end
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param mode? "r"|"rb"|"w+"|"a+" the open mode
--- @param opt? xmake.io.opts.open the options
--- @return file* #the file handler
function io.open(filepath, mode, opt) end

--- Load all table contents from the specified path file deserialization
---
--- You can load serialized table contents from a file, generally used with `io.save`
---
--- @example
--- ```lua
--- -- Load the contents of the serialized file to the table
--- local data = io.load("xxx.txt")
--- if data then
---
---     -- Dump prints the contents of the entire table in the terminal, formatting the output
---     utils.dump(data)
--- end
--- ```
--- @endexample
---
--- @see io.save
--- @param filepath string|xmake.path the file path
--- @param opt? xmake.io.opts.open the options
--- @return any #the object
function io.load(filepath, opt) end

--- Serialize all table contents to the specified path file
---
--- You can serialize the contents of the table to the specified file, generally used in conjunction with `io.load`
---
--- @example
--- ```lua
--- io.save("xxx.txt", {a = "a", b = "b", c = "c"})
--- ```
--- The result of the storage is:
--- ```
--- {
---     ["b"] = "b",
---     ["a"] = "a",
---     ["c"] = "c"
--- }
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param object any the object
--- @param opt? xmake.io.opts.open the options
function io.save(filepath, object, opt) end

--- Read everything from the specified path file
---
--- It is more convenient to directly read the contents of the entire file without opening the file,
---
--- @example
--- ```lua
--- local data = io.readfile("xxx.txt")
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param opt? xmake.io.opts.open the options
--- @return any #the object
function io.readfile(filepath, opt) end

--- Write all content to the specified path file
---
--- It is more convenient to directly write the contents of the entire file without opening the file
---
--- @example
--- ```lua
--- io.writefile("xxx.txt", "all data")
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param data any the data
--- @param opt? xmake.io.opts.open the options
function io.writefile(filepath, data, opt) end

--- Full text replaces the contents of the specified path file
---
--- Similar to the `string.gsub` interface, the full-text pattern matches the replacement content, but here is the direct operation file
---
--- @example
--- ```lua
--- -- Remove all whitespace characters from the file
--- io.gsub("xxx.txt", "%s+", "")
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param pattern string pattern
--- @param replace string replace
--- @param opt? xmake.io.opts.open the options
function io.gsub(filepath, pattern, replace, opt) end

--- Read and display the tail content of the file
---
--- Reads the data of the specified number of lines at the end of the file and displays a command like `cat xxx.txt | tail -n 10`
---
--- @example
--- ```lua
--- -- Display the last 10 lines of the file
--- io.tail("xxx.txt", 10)
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param linecount number the last line count
--- @param opt? xmake.io.opts.open the options
function io.tail(filepath, linecount, opt) end

--- Read and display all contents of a file
---
--- Read all the contents of the file and display it, similar to the `cat xxx.txt` command
---
--- @example
--- ```lua
--- io.cat("xxx.txt")
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param linecount number the line count
--- @param opt? xmake.io.opts.open the options
function io.cat(filepath, linecount, opt) end

--- Formatted output content to file with newline
---
--- Directly format the passed parameter to output a line of string to the file with a line break
---
--- @example
--- ```lua
--- io.print("xxx.txt", "hello %s!", "xmake")
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param pattern string pattern
--- @vararg any the parameters
function io.print(filepath, pattern, ...) end

--- Formatted output to file without line breaks
---
--- Directly format the passed parameter to output a line of string to the file without a line break
---
--- @example
--- ```lua
--- io.printf("xxx.txt", "hello %s!\n", "xmake")
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param pattern string pattern
--- @vararg any the parameters
function io.printf(filepath, pattern, ...) end

--- Read all lines from file
---
--- Returns all lines from a given file name
---
--- @example
--- ```lua
--- local lines = io.lines("xxx.txt")
--- for line in lines do
---     print(line)
--- end
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param opt? xmake.io.opts.open the options
--- @return string[] #the lines of the file
function io.lines(filepath, opt) end

--- Open a lock of a file
---
--- Returns a file lock object when successfully locking the file
---
--- @example
--- ```lua
--- local lock = io.openlock("xxx.txt")
--- lock:lock()
--- lock:unlock()
--- lock:close()
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @return xmake.io.lock #lock
function io.openlock(filepath) end

--- Replace text of the given file and return the replaced data
---
--- Replaces a given pattern in a file by a replacement string
---
--- @example
--- ```lua
--- -- replace string "Hello" in "xxx.txt" with "World"
--- io.replace("xxx.txt", "Hello", "World")
--- -- if you want to replace a string and not a pattern
--- io.replace("xxx.txt", "1+1=2", "2+2=4", {plain = true})
--- ```
--- @endexample
---
--- @param filepath string|xmake.path the file path
--- @param pattern string pattern
--- @param replace string replace
--- @param opt? xmake.io.opts.replace the options
function io.replace(filepath, pattern, replace, opt) end

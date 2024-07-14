--- @meta
--- [builtin modules](https://xmake.io/#/manual/builtin_modules)

---
--- Merge multiple tables and return
---
--- @vararg table tables
--- @return table
function table.join(...) end

---
--- Merge multiple tables into the first table
---
--- @param self table
--- @vararg table tables
--- @return table
function table.join2(self, ...) end

---
--- Deduplicate the contents of the table
--- 
--- @param self table
--- @return table
function table.unique(self) end

---
--- Get the slice of the table
---
--- @param self any[]
--- @param first number slice start
--- @param last number slice last
--- @param step number the step of the slice
--- @return any[]
function table.slice(self, first, last, step) end

---
--- Determine that the table contains the specified value
---
--- @param self table
--- @vararg any values
--- @return boolean
function table.contains(self, ...) end

---
--- Get an ordered list of keys
---
--- @param self table
--- @return any[] # keys
function table.orderkeys(self) end

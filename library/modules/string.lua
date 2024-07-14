--- @meta
--- [builtin modules](https://xmake.io/#/manual/builtin_modules)

---
--- Determine if the beginning of the string matches
---
--- @param self string
--- @vararg string prefix
--- @return boolean
function string.startswith(self, ...) end

---
--- Determine if the end of the string matches
---
--- @param self string
--- @param ... string suffix
--- @return boolean
function string.endswith(self, ...) end

---
--- Split String
---
--- @param self string
--- @param delimiter string delimiter
--- @param opts any options
--- @return string[]
function string.split(self, delimiter, opts) end

---
--- Remove the left and right whitespace characters
---
--- @param self string
--- @return string
function string.trim(self) end

---
--- Remove the whitespace character to the left of the string 
---
--- @param self string
--- @return string
function string.ltrim(self) end

---
--- Remove the whitespace character to the right of the string
---
--- @param self string
--- @return string
function string.rtrim(self) end

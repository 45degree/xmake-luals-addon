---@meta

--- @class xmake.version
version = {}

--- check version is greater or equal
--- @param rhs string|xmake.version others version
--- @return boolean # current is greater or equal to others
function version:ge(rhs) end

--- check version is less or equal
--- @param rhs string|xmake.version others version
--- @return boolean # current is less or equal to others
function version:le(rhs) end

--- check version is less
--- @param rhs string|xmake.version others version
--- @return boolean # current is less to others
function version:lt(rhs) end

--- check version is greater
--- @param rhs string|xmake.version others version
--- @return boolean # current is greater to others
function version:gt(rhs) end

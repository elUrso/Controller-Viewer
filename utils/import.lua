local import
local importLog

import = function(packageName)
	if type(packageName) ~= Type.string then
		return nil
	end
	local importLocalPath = _G.importLocalPath
	_G.importLocalPath = "dep/" .. packageName .. "/"
	local res = require("dep/" .. packageName .. "/import")
	_G.importLocalPath = importLocalPath
	importLog(res)
	return res
end

importLog = function(package)
	print("import: " .. package.name .. " (" .. package.version .. ") was loaded successfully")
end

return import

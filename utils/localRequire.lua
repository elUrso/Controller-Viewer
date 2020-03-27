local localRequire

localRequire = function(path)
	return require(importLocalPath .. path)
end

return localRequire

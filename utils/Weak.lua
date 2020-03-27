local Weak
local WeakMetatable

Weak = {}
WeakMetatable = {
	__call = function(_self)
		local weak = {}
		local weakMetatable = { __mode = "v" }
		setmetatable(weak, weakMetatable)
		return weak
	end,
	__tostring = "<std> built-in Weak"
}

setmetatable(Weak, WeakMetatable)

return Weak

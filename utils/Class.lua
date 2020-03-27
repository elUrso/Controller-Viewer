local Class
local ClassMetatable

Class = {}
ClassMetatable = {}

-- Meta

-- Static
ClassMetatable.__call = function(self, ...)
	self.new(...)
end

-- Local
return Class

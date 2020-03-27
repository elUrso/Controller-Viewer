local Node = {}

Node.mt = {}
Node.mt.__call = function(...)
	return Node.new(...)
end

Node.mt.__tostring = function()
	return "Class Node"
end

Node.imt = {}
Node.imt.__index = function(table, key)
	return Node.i[key]
end

Node.i = {}

Node.i.addChild = function(self, node)
	table.insert(self.children, node)
	node.weak.parent = self
end

Node.i.draw = function(self)
	self:innerDraw()
	for i, v in ipairs(self.children) do
		v:draw()
	end
end

Node.i.innerDraw = function(self) end

Node.i.origin = function(self)
	if self.weak.parent then
		return self.weak.parent.x or 0, self.weak.parent.y or 0
	end
	return 0, 0
end

Node.i.position = function(self)
	local x, y = self:origin()
	return x + self.x, y + self.y
end

Node.new = function()
	node = {}
	setmetatable(node, Node.imt)
	node.children = {}
	node.weak = Weak()
	return node
end

setmetatable(Node, Node.mt)

return Node

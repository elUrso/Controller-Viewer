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
end

Node.i.draw = function(self)
	self:innerDraw()
	for i, v in ipairs(self.children) do
		v:draw()
	end
end

Node.i.innerDraw = function(self) end

Node.new = function()
	node = {}
	setmetatable(node, Node.imt)
	node.children = {}

	return node
end

setmetatable(Node, Node.mt)

return Node

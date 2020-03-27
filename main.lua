require "standard"

SK = import "SK"
scene = SK.Node()
state = {}

function love.load(arg)
	-- 400x400 fixed size window
	state.joystickCount =  love.joystick.getJoystickCount()
	state.dpad = {}
	state.dpad.up = false
	state.dpad.right = false
	state.dpad.down = false
	state.dpad.left = false
	state.face = {}
	state.face.a = false
	state.face.b = false
	state.face.x = false
	state.face.y = false
	state.laxis = {}
	state.laxis.x = 0
	state.laxis.y = 0
	state.laxis.button = false
	state.raxis = {}
	state.raxis.x = 0
	state.raxis.y = 0
	state.raxis.button = false
	state.trigger = {}
	state.trigger.r = 0
	state.trigger.l = 0
	state.shoulder = {}
	state.shoulder.r = false
	state.shoulder.l = false
	state.menu = false
	state.start = false
	state.select = false

	-- joystick counter
	counter = SK.Node()
	counter.x = 10
	counter.y = 10
	counter.innerDraw = function(self)
		local x, y = self:position()
		love.graphics.print("Joysticks: " .. state.joystickCount, x, y)
	end

	-- dpad
	dpad = SK.Node()
	dpad.x = 50
	dpad.y = 50
	dpad.innerDraw = function(self)
		local x, y = self:position()
		if state.dpad.up then
			love.graphics.rectangle("fill", x+10, y, 10, 10)
		else
			love.graphics.rectangle("line", x+10, y, 10, 10)
		end
		if state.dpad.right then
			love.graphics.rectangle("fill", x+20, y+10, 10, 10)
		else
			love.graphics.rectangle("line", x+20, y+10, 10, 10)
		end
		if state.dpad.down then
			love.graphics.rectangle("fill", x+10, y+20, 10, 10)
		else
			love.graphics.rectangle("line", x+10, y+20, 10, 10)
		end
		if state.dpad.left then
			love.graphics.rectangle("fill", x, y+10, 10, 10)
		else
			love.graphics.rectangle("line", x, y+10, 10, 10)
		end
	end

	-- face
	face = SK.Node()
	face.x = 100
	face.y = 50
	face.innerDraw = function(self)
		local x, y = self:position()
		if state.face.y then
			love.graphics.circle("fill", x+15, y+5, 5)
		else
			love.graphics.circle("line", x+15, y+5, 5)
		end
		if state.face.b then
			love.graphics.circle("fill", x+25, y+15, 5)
		else
			love.graphics.circle("line", x+25, y+15, 5)
		end
		if state.face.a then
			love.graphics.circle("fill", x+15, y+25, 5)
		else
			love.graphics.circle("line", x+15, y+25, 5)
		end
		if state.face.x then
			love.graphics.circle("fill", x+5, y+15, 5)
		else
			love.graphics.circle("line", x+5, y+15, 5)
		end
	end

	-- laxis
	laxis = SK.Node()
	laxis.x = 50
	laxis.y = 100
	laxis.r = 15
	laxis.innerDraw = function(self)
		local x, y = self:position()
		local r = self.r
		love.graphics.circle("line", x+r, y+r, r)
		centerx = x+r + state.laxis.x * r
		centery = y+r + state.laxis.y * r
		love.graphics.line(centerx-2, centery-2, centerx+2, centery+2)
		love.graphics.line(centerx-2, centery+2, centerx+2, centery-2)
	end

	-- raxis
	local raxis = SK.Node()
	raxis.x = 100
	raxis.y = 100
	raxis.r = 15
	raxis.innerDraw = function(self)
		local x, y = self:position()
		local r = self.r
		love.graphics.circle("line", x+r, y+r, r)
		centerx = x+r + state.raxis.x * r
		centery = y+r + state.raxis.y * r
		love.graphics.line(centerx-2, centery-2, centerx+2, centery+2)
		love.graphics.line(centerx-2, centery+2, centerx+2, centery-2)
	end

	-- rtrigger
	local rtrigger = SK.Node()
	rtrigger.x = 100
	rtrigger.y = 30
	rtrigger.innerDraw = function(self)
		local x, y = self:position()
		love.graphics.rectangle('line', x, y, 30, 5)
		love.graphics.rectangle('fill', x, y, 30*state.trigger.r, 5)
	end

	-- ltrigger
	local ltrigger = SK.Node()
	ltrigger.x = 50
	ltrigger.y = 30
	ltrigger.innerDraw = function(self)
		local x, y = self:position()
		love.graphics.rectangle('line', x, y, 30, 5)
		love.graphics.rectangle('fill', x, y, 30*state.trigger.l, 5)
	end

	-- lshoulder
	local lshoulder = SK.Node()
	lshoulder.x = 50
	lshoulder.y = 35
	lshoulder.innerDraw = function(self)
		local x, y = self:position()
		if state.shoulder.l then
			love.graphics.rectangle('fill', x, y, 30, 5)
		else
			love.graphics.rectangle('line', x, y, 30, 5)
		end
	end

	-- rshoulder
	local rshoulder = SK.Node()
	rshoulder.x = 100
	rshoulder.y = 35
	rshoulder.innerDraw = function(self)
		local x, y = self:position()
		if state.shoulder.r then
			love.graphics.rectangle('fill', x, y, 30, 5)
		else
			love.graphics.rectangle('line', x, y, 30, 5)
		end
	end

	-- menus
	local menus = SK.Node()
	menus.x = 80
	menus.y = 50
	menus.innerDraw = function(self)
		local x, y = self:position()
		if state.menu then
			love.graphics.rectangle('fill', x+7.5, y, 5, 5)
		else
			love.graphics.rectangle('line', x+7.5, y, 5, 5)
		end

		if state.start then
			love.graphics.rectangle('fill', x+15, y, 5, 5)

		else
			love.graphics.rectangle('line', x+15, y, 5, 5)
		end

		if state.select then
			love.graphics.rectangle('fill', x, y, 5, 5)
		else
			love.graphics.rectangle('line', x, y, 5, 5)
		end
	end


	scene:addChild(counter)
	scene:addChild(dpad)
	scene:addChild(face)
	scene:addChild(laxis)
	scene:addChild(raxis)
	scene:addChild(ltrigger)
	scene:addChild(rtrigger)
	scene:addChild(lshoulder)
	scene:addChild(rshoulder)
	scene:addChild(menus)
end

function love.draw()
	scene:draw()
end

function love.joystickadded(joystick)
	state.joystickCount =  love.joystick.getJoystickCount()
end

function love.joystickremoved(joystick)
	state.joystickCount =  love.joystick.getJoystickCount()
end

function love.gamepadpressed(joystick, button)
	if button == "dpup" then
		state.dpad.up = true
	end
	if button == "dpright" then
		state.dpad.right = true
	end
	if button == "dpdown" then
		state.dpad.down = true
	end
	if button == "dpleft" then
		state.dpad.left = true
	end
	if button == "a" then
		state.face.a = true
	end
	if button == "b" then
		state.face.b = true
	end
	if button == "x" then
		state.face.x = true
	end
	if button == "y" then
		state.face.y = true
	end
	if button == "leftshoulder" then
		state.shoulder.l = true
	end
	if button == "rightshoulder" then
		state.shoulder.r = true
	end
	if button == "leftstick" then
		state.laxis.button = true
	end
	if button == "rightstick" then
		state.raxis.button = true
	end
	if button == "back" then
		state.select = true
	end
	if button == "start" then
		state.start = true
	end
	if button == "guide" then
		state.menu = true
	end
end

function love.gamepadreleased(joystick, button)
	if button == "dpup" then
		state.dpad.up = false
	end
	if button == "dpright" then
		state.dpad.right = false
	end
	if button == "dpdown" then
		state.dpad.down = false
	end
	if button == "dpleft" then
		state.dpad.left = false
	end
	if button == "a" then
		state.face.a = false
	end
	if button == "b" then
		state.face.b = false
	end
	if button == "x" then
		state.face.x = false
	end
	if button == "y" then
		state.face.y = false
	end
	if button == "leftshoulder" then
		state.shoulder.l = false
	end
	if button == "rightshoulder" then
		state.shoulder.r = false
	end
	if button == "leftstick" then
		state.laxis.button = false
	end
	if button == "rightstick" then
		state.raxis.button = false
	end
	if button == "back" then
		state.select = false
	end
	if button == "start" then
		state.start = false
	end
	if button == "guide" then
		state.menu = false
	end


end

function love.gamepadaxis(joystick, axis, value)
	if axis == "leftx" then
		state.laxis.x = value
	end
	if axis == "lefty" then
		state.laxis.y = value
	end
	if axis == "rightx" then
		state.raxis.x = value
	end
	if axis == "righty" then
		state.raxis.y = value
	end
	if axis == "triggerleft" then
		state.trigger.l = value
	end
	if axis == "triggerright" then
		state.trigger.r = value
	end
end

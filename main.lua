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

	-- joystick counter
	counter = SK.Node()
	counter.x = 10
	counter.y = 10
	counter.innerDraw = function(self)
		love.graphics.print("Joysticks: " .. state.joystickCount, self.x, self.y)
	end

	-- dpad
	dpad = SK.Node()
	dpad.x = 50
	dpad.y = 50
	dpad.innerDraw = function(self)
		if state.dpad.up then
			love.graphics.rectangle("fill", self.x+10, self.y, 10, 10)
		else
			love.graphics.rectangle("line", self.x+10, self.y, 10, 10)
		end
		if state.dpad.right then
			love.graphics.rectangle("fill", self.x+20, self.y+10, 10, 10)
		else
			love.graphics.rectangle("line", self.x+20, self.y+10, 10, 10)
		end
		if state.dpad.down then
			love.graphics.rectangle("fill", self.x+10, self.y+20, 10, 10)
		else
			love.graphics.rectangle("line", self.x+10, self.y+20, 10, 10)
		end
		if state.dpad.left then
			love.graphics.rectangle("fill", self.x, self.y+10, 10, 10)
		else
			love.graphics.rectangle("line", self.x, self.y+10, 10, 10)
		end
	end

	-- face
	face = SK.Node()
	face.x = 100
	face.y = 50
	face.innerDraw = function(self)
		if state.face.y then
			love.graphics.circle("fill", self.x+15, self.y+5, 5)
		else
			love.graphics.circle("line", self.x+15, self.y+5, 5)
		end
		if state.face.b then
			love.graphics.circle("fill", self.x+25, self.y+15, 5)
		else
			love.graphics.circle("line", self.x+25, self.y+15, 5)
		end
		if state.face.a then
			love.graphics.circle("fill", self.x+15, self.y+25, 5)
		else
			love.graphics.circle("line", self.x+15, self.y+25, 5)
		end
		if state.face.x then
			love.graphics.circle("fill", self.x+5, self.y+15, 5)
		else
			love.graphics.circle("line", self.x+5, self.y+15, 5)
		end
	end

	-- laxis
	laxis = SK.Node()
	laxis.x = 50
	laxis.y = 100
	laxis.r = 15
	laxis.innerDraw = function(self)
		love.graphics.circle("line", self.x+self.r, self.y+self.r, self.r)
		centerx = self.x+self.r + state.laxis.x * self.r
		centery = self.y+self.r + state.laxis.y * self.r
		love.graphics.line(centerx-2, centery-2, centerx+2, centery+2)
		love.graphics.line(centerx-2, centery+2, centerx+2, centery-2)
	end


	scene:addChild(counter)
	scene:addChild(dpad)
	scene:addChild(face)
	scene:addChild(laxis)
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
end

function love.gamepadaxis(joystick, axis, value)
	if axis == "leftx" then
		state.laxis.x = value
	end
	if axis == "lefty" then
		state.laxis.y = value
	end
end

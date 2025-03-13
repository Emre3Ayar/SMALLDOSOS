
local love = require "love"
local myApi = require "MyApi"


local calculatorApp = {}
local buttonW = 30
local buttonH = 30

local calcArrayX = 130
local calcArrayY = 140
local calcArraySpaceY = 10
local calcArraySpaceX = 10

local result = 0

local buttonPressToggle3 = 0
local buttonPressToggle2 = 0
local buttonPressToggle = 0

--Color settings
primaryColor={52, 57, 90}
BackgroundColor={50,128,204}

function calculatorApp.load()

end

function calculatorApp.draw()
	love.graphics.print(result, 10, 10)
	--1 button
	calculatorApp.ButtonEvent(calcArrayX,calcArrayY, primaryColor, "1", buttonW,buttonH, calculatorApp.calcButtonEvent, 1)
	
	--2 button
	calculatorApp.ButtonEvent2(calcArrayX+buttonW+calcArraySpaceX,calcArrayY, primaryColor, "2", buttonW,buttonH, calculatorApp.calcButtonEvent, 2)
	
	--3 button
	calculatorApp.ButtonEvent((calcArrayX+(buttonW+calcArraySpaceX)*2),calcArrayY, primaryColor, "3", buttonW,buttonH, calculatorApp.calcButtonEvent, 3)
	
	
	--4 button
	calculatorApp.ButtonEvent(calcArrayX,calcArrayY-buttonH-calcArraySpaceY, primaryColor, "4", buttonW,buttonH, calculatorApp.calcButtonEvent, 4)
	
	--5 button
	calculatorApp.ButtonEvent(calcArrayX+buttonW+calcArraySpaceX,(calcArrayY-buttonH-calcArraySpaceY), primaryColor, "5", buttonW,buttonH, calculatorApp.calcButtonEvent, 5)
	
	--6 button
	calculatorApp.ButtonEvent((calcArrayX+(buttonW+calcArraySpaceX)*2),(calcArrayY-(buttonH-calcArraySpaceY)*2), primaryColor, "6", buttonW,buttonH, calculatorApp.calcButtonEvent, 6)
	
	
	--7 button
	calculatorApp.ButtonEvent(calcArrayX,calcArrayY-(buttonH+calcArraySpaceY)*2, primaryColor, "7", buttonW,buttonH, calculatorApp.calcButtonEvent, 7)
	
	--8 button
	calculatorApp.ButtonEvent(calcArrayX+buttonW+calcArraySpaceX,calcArrayY-(buttonH+calcArraySpaceY)*2, primaryColor, "8", buttonW,buttonH, calculatorApp.calcButtonEvent, 8)
	
	--9 button
	calculatorApp.ButtonEvent((calcArrayX+(buttonW+calcArraySpaceX)*2),calcArrayY-(buttonH+calcArraySpaceY)*2, primaryColor, "9", buttonW,buttonH, calculatorApp.calcButtonEvent, 9)
end

function calculatorApp.ButtonEvent(x,y, pc, buttonText, w, h, event, value)-- Button (x position button, y position button, primarycolor, button text, width, height, button event)
	love.graphics.rectangle("fill", x,y, w,h)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print(buttonText, x+w/7, y+h/3)
	love.graphics.setColor(pc[1], pc[2], pc[3])
	-- button hitbox
	if love.mouse.isDown(1) and love.mouse.getX() >= x and love.mouse.getX() <= x+w and love.mouse.getY() >= y and love.mouse.getY() <= y+h then
		buttonPressToggle = 2
	end
	-- to prevent when button held down
	if buttonPressToggle == 2 then
		if love.mouse.isDown(1) ~= true then
			love.graphics.setColor(44, 44, 44)
			love.graphics.rectangle("fill", x,y, w,h)
			event(value)
			buttonPressToggle = 0
		end
	end
	love.graphics.setColor(pc[1], pc[2], pc[3])
end

function calculatorApp.ButtonEvent2(x,y, pc, buttonText, w, h, event, value)-- Button (x position button, y position button, primarycolor, button text, width, height, button event)
	love.graphics.rectangle("fill", x,y, w,h)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print(buttonText, x+w/7, y+h/3)
	love.graphics.setColor(pc[1], pc[2], pc[3])
	-- button hitbox
	if love.mouse.isDown(1) and love.mouse.getX() >= x and love.mouse.getX() <= x+w and love.mouse.getY() >= y and love.mouse.getY() <= y+h then
		buttonPressToggle2 = 2
	end
	-- to prevent when button held down
	if buttonPressToggle2 == 2 then
		if love.mouse.isDown(1) ~= true then
			love.graphics.setColor(44, 44, 44)
			love.graphics.rectangle("fill", x,y, w,h)
			event(value)
			buttonPressToggle2 = 0
		end
	end
	love.graphics.setColor(pc[1], pc[2], pc[3])
end

function calculatorApp.ButtonEvent3(x,y, pc, buttonText, w, h, event, value)-- Button (x position button, y position button, primarycolor, button text, width, height, button event)
	love.graphics.rectangle("fill", x,y, w,h)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print(buttonText, x+w/7, y+h/3)
	love.graphics.setColor(pc[1], pc[2], pc[3])
	-- button hitbox
	if love.mouse.isDown(1) and love.mouse.getX() >= x and love.mouse.getX() <= x+w and love.mouse.getY() >= y and love.mouse.getY() <= y+h then
		buttonPressToggle3 = 2
	end
	-- to prevent when button held down
	if buttonPressToggle3 == 2 then
		if love.mouse.isDown(1) ~= true then
			love.graphics.setColor(44, 44, 44)
			love.graphics.rectangle("fill", x,y, w,h)
			event(value)
			buttonPressToggle3 = 0
		end
	end
	love.graphics.setColor(pc[1], pc[2], pc[3])
end

function calculatorApp.ButtonEvent3(x,y, pc, buttonText, w, h, event, value)-- Button (x position button, y position button, primarycolor, button text, width, height, button event)
	love.graphics.rectangle("fill", x,y, w,h)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print(buttonText, x+w/7, y+h/3)
	love.graphics.setColor(pc[1], pc[2], pc[3])
	-- button hitbox
	if love.mouse.isDown(1) and love.mouse.getX() >= x and love.mouse.getX() <= x+w and love.mouse.getY() >= y and love.mouse.getY() <= y+h then
		buttonPressToggle3 = 2
	end
	-- to prevent when button held down
	if buttonPressToggle3 == 2 then
		if love.mouse.isDown(1) ~= true then
			love.graphics.setColor(44, 44, 44)
			love.graphics.rectangle("fill", x,y, w,h)
			event(value)
			buttonPressToggle3 = 0
		end
	end
	love.graphics.setColor(pc[1], pc[2], pc[3])
end

function calculatorApp.calcButtonEvent(value)
	result = value
end


function calculatorApp.keypressed(key)

end

function calculatorApp.keyreleased(key, code)

end


function calculatorApp.update()
	-- select = false
end

return calculatorApp

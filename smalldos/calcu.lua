
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

--Color settings
primaryColor={52, 57, 90}
BackgroundColor={50,128,204}

local Second = false
local Number1 = "0"
local Number2 = ""
local My_Label = ""
--button object with functions
local ButtonO = {}
function ButtonO:new()
	local self = {}
	--toggle variable
	self.buttonPressToggle = 0
	
	function self.ButtonEvent(x,y, pc, buttonText, w, h, event, value)-- Button (x position button, y position button, primarycolor, button text, width, height, button event)
		love.graphics.rectangle("fill", x,y, w,h)
		love.graphics.setColor(255, 255, 255)
		love.graphics.print(buttonText, x+w/7, y+h/3)
		love.graphics.setColor(pc[1], pc[2], pc[3])
		-- button hitbox
		if love.mouse.isDown(1) and love.mouse.getX() >= x and love.mouse.getX() <= x+w and love.mouse.getY() >= y and love.mouse.getY() <= y+h then
			self.buttonPressToggle = 2
		end
		-- to prevent when button held down
		if self.buttonPressToggle == 2 then
			if love.mouse.isDown(1) ~= true then
				love.graphics.setColor(44, 44, 44)
				love.graphics.rectangle("fill", x,y, w,h)
				event(value)
				self.buttonPressToggle = 0
			end
		end
		love.graphics.setColor(pc[1], pc[2], pc[3])
	end
	
	function self.changeToggle(a)
		self.buttonPressToggle = a
		love.graphics.print(a, 80, 80)
	end
	
	function self.addToggle(a)
		self.buttonPressToggle = self.buttonPressToggle + a
	end
	
	return self
end


function calculatorApp.load()
	b1 = ButtonO:new()
	b2 = ButtonO:new()
	b3 = ButtonO:new()
	b4 = ButtonO:new()
	b5 = ButtonO:new()
	b6 = ButtonO:new()
	b7 = ButtonO:new()
	b8 = ButtonO:new()
	b9 = ButtonO:new()
	
	b10 = ButtonO:new()
	b11 = ButtonO:new()
	b12 = ButtonO:new()
	b13 = ButtonO:new()
end

function calculatorApp.draw()
	love.graphics.print(My_Label, 50, 20)
	--1 button
	b1.ButtonEvent(calcArrayX,calcArrayY, primaryColor, "1", buttonW,buttonH, calculatorApp.clickNumber, 1)
	--2 button
	b2.ButtonEvent(calcArrayX+buttonW+calcArraySpaceX,calcArrayY, primaryColor, "2", buttonW,buttonH, calculatorApp.clickNumber, 2)
	--3 button
	b3.ButtonEvent((calcArrayX+(buttonW+calcArraySpaceX)*2),calcArrayY, primaryColor, "3", buttonW,buttonH, calculatorApp.clickNumber, 3)
	--4 button
	b4.ButtonEvent(calcArrayX,calcArrayY-buttonH-calcArraySpaceY, primaryColor, "4", buttonW,buttonH, calculatorApp.clickNumber, 4)
	--5 button
	b5.ButtonEvent(calcArrayX+buttonW+calcArraySpaceX,(calcArrayY-buttonH-calcArraySpaceY), primaryColor, "5", buttonW,buttonH, calculatorApp.clickNumber, 5)
	--6 button
	b6.ButtonEvent((calcArrayX+(buttonW+calcArraySpaceX)*2),(calcArrayY-(buttonH-calcArraySpaceY)*2), primaryColor, "6", buttonW,buttonH, calculatorApp.clickNumber, 6)
	--7 button
	b7.ButtonEvent(calcArrayX,calcArrayY-(buttonH+calcArraySpaceY)*2, primaryColor, "7", buttonW,buttonH, calculatorApp.clickNumber, 7)
	--8 button
	b8.ButtonEvent(calcArrayX+buttonW+calcArraySpaceX,calcArrayY-(buttonH+calcArraySpaceY)*2, primaryColor, "8", buttonW,buttonH, calculatorApp.clickNumber, 8)
	--9 button
	b9.ButtonEvent((calcArrayX+(buttonW+calcArraySpaceX)*2),calcArrayY-(buttonH+calcArraySpaceY)*2, primaryColor, "9", buttonW,buttonH, calculatorApp.clickNumber, 9)
	
	b10.ButtonEvent(10,40, primaryColor, "=", buttonW,buttonH, calculatorApp._on_Result_pressed, "=")
	b11.ButtonEvent(10,80, primaryColor, "+", buttonW,buttonH, calculatorApp._on_Plus_pressed, "+")
	b12.ButtonEvent(10,120, primaryColor, "-", buttonW,buttonH, calculatorApp._on_Min_pressed, "-")
	b13.ButtonEvent(10,160, primaryColor, "<-", buttonW,buttonH, calculatorApp._on_Del_pressed, "-")
end


function calculatorApp.calcButtonEvent(value)
	result = value
end

function calculatorApp.clickNumber(value)
	if Second then
		Number2 = Number2 .. tostring(value)
		My_Label = Number2
	else
		Number1 = Number1 .. tostring(value)
		My_Label = Number1
	end
end
function calculatorApp._on_Result_pressed()
	result = 0;
	if Opera == "+" then
		result = tonumber(Number1) + tonumber(Number2)
	elseif Opera == "-" then 
		result = tonumber(Number1) - tonumber(Number2)
	end
		
	My_Label = tostring(result)
	Number1 = "0"
	Number2 = ""
	Opera = ""
	Second = false
end

function calculatorApp._on_Plus_pressed()
	Opera = "+"
	Second = true
end
function calculatorApp._on_Min_pressed()
	Opera = "-"
	Second = true
end
function calculatorApp._on_Del_pressed()
	if Number1:len() >= 1 then
		Number1 = Number1:sub(1, -2)
	else
		Number1 = "0"
	end
	My_Label = Number1
end


function calculatorApp.update()
	-- select = false
end

return calculatorApp

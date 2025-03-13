local love = require "love"
local lume = require "lume"
local myApi = require "MyApi"

local contact = require "contacts"
local calculator = require "calcu"

font = love.graphics.newFont(14)
selection = 0
local s
--Color settings
primaryColor={52, 57, 90}
BackgroundColor={50,128,204}
s = love.audio.newSource("so.wav")

function love.load()
	love.graphics.setFont(love.graphics.newFont(11))
	--set background color
	love.graphics.setBackgroundColor(BackgroundColor[1],BackgroundColor[2], BackgroundColor[3])
	--load mouse image
	image = love.graphics.newImage("muse.png")
	contact.load()
	calculator.load()
	s:play()
end

function love.draw()
	--CONFIRM button
	if selection == 0 then
		myApi.Button(20,20, primaryColor, "Contacts", 60,20, contactsButtonEvent)
		myApi.Button2(20,50, primaryColor, "Calculator", 60,20, calculatorButtonEvent)
	elseif selection == 1 then
		contact.draw()
	elseif selection == 2 then
		calculator.draw()
	end
	-- MOUSE -- Mouse event always at the end to render it last
	love.graphics.draw(image, love.mouse.getX(), love.mouse.getY())
end

function contactsButtonEvent()
	selection = 1
end

function calculatorButtonEvent()
	selection = 2
end

function love.textinput(t)
	if selection == 1 then
		contact.textinput(t)
	end
end

function love.keypressed(key)
	contact.keypressed(key)
	-- end program --
	if key == "escape" and selection == 0 then
		love.event.quit()
	elseif key == "escape" and selection == 1 then
		--love.filesystem.write("save", serialize(numberData))
		selection = 0
	elseif key == "escape" and selection == 2 then
		--love.filesystem.write("save", serialize(numberData))
		selection = 0
	end
end

function love.quit()
end

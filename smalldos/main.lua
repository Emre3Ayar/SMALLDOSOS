local love = require "love"
local lume = require "lume"
local myApi = require "MyApi"

local contact = require "contacts"
local calculator = require "calcu"
local sysinfo = require "sysinfo"
local notes = require "notes"

selection = 0
local s
--Color settings
primaryColor={52, 57, 90}
BackgroundColor={50,128,204}
s = love.audio.newSource("so.wav")

function love.load()
	love.graphics.setFont(love.graphics.newFont(8))
	--set background color
	love.graphics.setBackgroundColor(BackgroundColor[1],BackgroundColor[2], BackgroundColor[3])
	--load mouse image
	image = love.graphics.newImage("muse.png")
	image2 = love.graphics.newImage("U.png")
	image3 = love.graphics.newImage("U2.png")
	image4 = love.graphics.newImage("U3.png")
	image5 = love.graphics.newImage("U4.png")
	--load events
	contact.load()
	calculator.load()
	sysinfo.load()
	--sound
	s:play()
	--buttons
	buttonSysinfo = myApi.ButtonO:new()
	buttonContact = myApi.ButtonO:new()
	buttonCalculator = myApi.ButtonO:new()
	buttonNotes = myApi.ButtonO:new()
end

function love.draw()
	--CONFIRM button
	if selection == 0 then
		buttonContact.ButtonImageEvent(20,20, primaryColor, 60,20, contactsButtonEvent,0, image2)
		buttonCalculator.ButtonImageEvent(20,50, primaryColor, 60,20, calculatorButtonEvent, 0, image4)
		--myApi.Button2(20,80, primaryColor, "System info", 60,20, sysinfoButtonEvent)
		buttonSysinfo.ButtonImageEvent(20, 80, primaryColor, 60,20, sysinfoButtonEvent, 0, image3)
		buttonNotes.ButtonImageEvent(20, 110, primaryColor, 60,20, NoteButtonEvent, 0, image5)
	elseif selection == 1 then
		contact.draw()
	elseif selection == 2 then
		calculator.draw()
	elseif selection == 3 then
		sysinfo.draw()
	elseif selection == 4 then
		notes.draw()
	end
	-- MOUSE -- Mouse event always at the end to render it last
	quad = love.graphics.newQuad(0.1, 0.1, 50,50)
	love.graphics.draw(image,quad, love.mouse.getX(), love.mouse.getY())
end

function contactsButtonEvent()
	selection = 1
end

function calculatorButtonEvent()
	selection = 2
end

function sysinfoButtonEvent()
	selection = 3
end
function NoteButtonEvent()
	selection = 4
end

function love.textinput(t)
	if selection == 1 then
		contact.textinput(t)
	end
	if selection == 4 then
		notes.textinput(t)
	end
end

function love.keypressed(key)
	if selection == 1 then
		contact.keypressed(key)
	elseif selection == 4 then
		notes.keypressed(key)
	end
	
	-- end program --
	if key == "escape" and selection == 0 then
		love.event.quit()
	elseif key == "escape" and selection == 1 then
		--love.filesystem.write("save", serialize(numberData))
		selection = 0
	elseif key == "escape" and selection == 2 then
		selection = 0
	elseif key == "escape" and selection == 3 then
		selection = 0
	elseif key == "escape" and selection == 4 then
		selection = 0
	end
end

function love.quit()
end

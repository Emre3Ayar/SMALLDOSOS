
local love = require "love"
local myApi = require "MyApi"

local notes = {}
local text=""
--Color settings
primaryColor={52, 57, 90}
BackgroundColor={50,128,204}

function notes.load()

end

function notes.draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", 30,30, 200,200)
	love.graphics.setColor(0, 0, 0)
	love.graphics.line(40,40,220,40)
	love.graphics.print("Notes: ",40,45)
	myApi.inputField(40,60,text) -- window content
	--love.graphics.setColor(primaryColor[1], primaryColor[2], primaryColor[3])
end

function notes.keypressed(key)
	-- delete character from inputfield
	if key == "backspace" then 
		text = string.sub(text, -#text, #text-1)
	end
end

function notes.textinput(t) -- keyboard
	text = text..t
end

function notes.update()
	-- select = false
end

return notes

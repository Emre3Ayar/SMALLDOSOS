
local love = require "love"
local myApi = require "MyApi"

local music = {}
--Color settings
primaryColor={52, 57, 90}
BackgroundColor={50,128,204}

song = love.audio.newSource("M1.wav")
song2 = love.audio.newSource("M1.wav")

function music.load()

end

function music.draw()
	myApi.smurfWindow(40,40,160,100, primaryColor)
	b1.ButtonEvent(40,40, primaryColor, "|>", 20,20, music.playmusic, 1)
	myApi.TextRec(70,40, primaryColor, "Rayman 2", 110,20)
	
	b1.ButtonEvent(40,70, primaryColor, "|>", 20,20, music.playmusic, 1)
	myApi.TextRec(70,70, primaryColor, "Daxter: Tik mission", 110,20)
	
end

function music.keypressed(key)
	if key == "escape" then
		song:stop()
	end
end

function music.playmusic(x) -- keyboard
	if x ==1 then
		song2:stop()
		song:play()
	elseif x == 2 then
		song:stop()
		song2:play()
	end
	
end

function music.textinput(t) -- keyboard
end

function music.update()
	-- select = false
end

return music

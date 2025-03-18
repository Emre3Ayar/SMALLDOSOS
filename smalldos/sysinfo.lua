
local love = require "love"
local myApi = require "MyApi"


local sysinfo = {}

--Color settings
primaryColor={52, 57, 90}
BackgroundColor={50,128,204}
memory=0

function sysinfo.load()
end

function sysinfo.draw()
	love.graphics.print("OS: ".. love.system.getOS(), 10, 10)
	love.graphics.print("Memory: ".. memory .." KB", 10, 30)
	love.graphics.print("Running time: ".. love.timer.getTime(), 10, 180)
	if math.floor(love.timer.getTime()*10)%6 == 0 then
		memory = love.system.getMemUsage()
	end
	
end


function sysinfo.update()
	-- select = false
end

return sysinfo

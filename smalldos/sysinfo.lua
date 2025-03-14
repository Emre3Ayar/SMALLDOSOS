
local love = require "love"
local myApi = require "MyApi"


local sysinfo = {}

--Color settings
primaryColor={52, 57, 90}
BackgroundColor={50,128,204}

function sysinfo.load()
end

function sysinfo.draw()
	love.graphics.print("OS: ".. love.system.getOS(), 10, 10)
	love.graphics.print("Memory: ".. love.system.getMemUsage(), 10, 30)
end


function sysinfo.update()
	-- select = false
end

return sysinfo

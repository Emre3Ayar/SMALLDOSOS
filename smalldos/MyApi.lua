
local api = {}
api.ButtonO = {}
s = love.audio.newSource("so.wav")
function api.encodeDecode(n,b)--n = to be translated data b = decode or encode
	if b then--(true,decode) from number to string
		local r=""
		for i=0,#n,1
			do
				if n[i] == 0 then r=r.."A" 
				elseif n[i] == 1 then r=r.."B"elseif n[i] == 2 then r=r.."C"
				elseif n[i] == 3 then r=r.."D"elseif n[i] == 4 then r=r.."E"
				elseif n[i] == 5 then r=r.."F"elseif n[i] == 6 then r=r.."G"
				elseif n[i] == 7 then r=r.."H"elseif n[i] == 8 then r=r.."I"
				elseif n[i] == 9 then r=r.."J"elseif n[i] == 10 then r=r.."K"
				elseif n[i] == 11 then r=r.."L"elseif n[i] == 12 then r=r.."M"
				elseif n[i] == 13 then r=r.."N"elseif n[i] == 14 then r=r.."O"
				elseif n[i] == 15 then r=r.."P"elseif n[i] == 16 then r=r.."Q"
				elseif n[i] == 17 then r=r.."R"elseif n[i] == 18 then r=r.."S"
				elseif n[i] == 19 then r=r.."T"elseif n[i] == 20 then r=r.."U"
				elseif n[i] == 21 then r=r.."V"elseif n[i] == 22 then r=r.."W"
				elseif n[i] == 23 then r=r.."X"elseif n[i] == 24 then r=r.."Y"
				elseif n[i] == 25 then r=r.."Z"
			 end
		end
	else --(false,Encode) from String to number  
		local r={}
		r[1] = n[1]
		for i=1,string.len(n[2]),1
			do
				if n[2]:sub(i,i) == "A" then r[i+1] = 0
				elseif n[2]:sub(i,i) == "B" then r[i+1] = 1 elseif n[2]:sub(i,i) == "C" then r[i+1] = 2
				elseif n[2]:sub(i,i) == "D" then r[i+1] = 3 elseif n[2]:sub(i,i) == "E" then r[i+1] = 4
				elseif n[2]:sub(i,i) == "F" then r[i+1] = 5 elseif n[2]:sub(i,i) == "G" then r[i+1] = 6
				elseif n[2]:sub(i,i) == "H" then r[i+1] = 7 elseif n[2]:sub(i,i) == "I" then r[i+1] = 8
				elseif n[2]:sub(i,i) == "J" then r[i+1] = 9 elseif n[2]:sub(i,i) == "K" then r[i+1] = 10
				elseif n[2]:sub(i,i) == "L" then r[i+1] = 11 elseif n[2]:sub(i,i) == "M" then r[i+1] = 12
				elseif n[2]:sub(i,i) == "N" then r[i+1] = 13 elseif n[2]:sub(i,i) == "O" then r[i+1] = 14
				elseif n[2]:sub(i,i) == "P" then r[i+1] = 15 elseif n[2]:sub(i,i) == "Q" then r[i+1] = 16
				elseif n[2]:sub(i,i) == "R" then r[i+1] = 17 elseif n[2]:sub(i,i) == "S" then r[i+1] = 18
				elseif n[2]:sub(i,i) == "T" then r[i+1] = 19 elseif n[2]:sub(i,i) == "U" then r[i+1] = 20
				elseif n[2]:sub(i,i) == "V" then r[i+1] = 21 elseif n[2]:sub(i,i) == "W" then r[i+1] = 22
				elseif n[2]:sub(i,i) == "X" then r[i+1] = 23 elseif n[2]:sub(i,i) == "Y" then r[i+1] = 24
				elseif n[2]:sub(i,i) == "Z" then r[i+1] = 25
				end
		end
		r[string.len(n[2])+2] = 99 -- adding seperation 99
		-- example data [09883, 3, 7, 9, 99]
	end  
	return r
end

function api.deletePerson(n,a)--n = input array a = selected
	local finish = false start = 1 ending = 0 b = 0
	
	for i=0,#n,1
	do
		if n[i] == 99 then
			if b==a-1 then
				ending = i
				DataAmount = (ending - start)-1
				finish=true
			end
			if finish == false then
				start = i
			end
			b=b+1
		end
	end
	--if start == 1 then start= end
	for i=1,DataAmount+2,1
	do table.remove(n,(start)) end
end

function api.getTelefonData(n,a)--n = input array a = selected
	local b=0 local r={} local rr={} local j=1
	
	for i=0,#n,1
	do
		if n[i] == 99 then b=b+1 end
		if b==a-1 then
			r[j] = n[i+1]
			j = j+1
		end
	end
	--table.remove(r,1)
	rr[0] = r[1]
	rr[1] = api.encodeDecode(r,true)
	return rr
end

function api.inputField(inputFieldX,inputFieldY, text)-- Text field
	-- keyboard cursor indicator
	if math.floor(love.timer.getTime()*10)%6 == 0 then
		local bob = love.graphics.getFont():getWidth(text)
		love.graphics.line(inputFieldX+(bob),inputFieldY,inputFieldX+(bob),inputFieldY+8)
	else
		love.graphics.line(0,0,0,0)
	end
	--writing text in field
	love.graphics.print(text,inputFieldX,inputFieldY)
end

function api.smurfWindow(x,y, ww, wh, pc)--drawing window x, y position ww = window width wh = window height
	--love.graphics.newCanvas(130, 50)
	--border
	local borderWidth = 5
	local textPadding = 10
	love.graphics.setColor(pc[1], pc[2], pc[3])
	love.graphics.rectangle("fill", x-(borderWidth+textPadding), y-(borderWidth+textPadding),ww+textPadding,wh+textPadding)
	-- window inside
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", x-textPadding, y-textPadding,ww,wh)
	-- change color back
	love.graphics.setColor(pc[1], pc[2], pc[3])
end

function api.tColor(x, y, pc, toColor, text)--drawing window x, y position ww = window width wh = window height
	love.graphics.setColor(toColor[1], toColor[2], toColor[3])
	love.graphics.print(text,x,y)
	-- change color back
	love.graphics.setColor(pc[1], pc[2], pc[3])
end

function api.Button(x,y, pc, buttonText, w, h, event)-- Button (x position button, y position button, primarycolor, button text, width, height, button event)
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
			event()
			buttonPressToggle = 0
		end
	end
	love.graphics.setColor(pc[1], pc[2], pc[3])
end

function api.TextRec(x,y, pc, Text, w, h)-- Button (x position button, y position button, primarycolor, button text, width, height, button event)
		love.graphics.rectangle("fill", x,y, w,h)
		love.graphics.setColor(255, 255, 255)
		
		tt = love.graphics.getFont():getWidth(Text)
		love.graphics.print(Text, x+w/2-tt/2, y+h/3)
		
		
		love.graphics.setColor(pc[1], pc[2], pc[3])
		love.graphics.setColor(pc[1], pc[2], pc[3])
	end

----------------------------
--Simpel Button with toggle press
function api.ButtonO:new()
	local self = {}
	--toggle variable
	self.buttonPressToggle = 0
	
	function self.ButtonEvent(x,y, pc, buttonText, w, h, event, value)-- Button (x position button, y position button, primarycolor, button text, width, height, button event)
		love.graphics.rectangle("fill", x,y, w,h)
		love.graphics.setColor(255, 255, 255)
		--text centering
		local t = love.graphics.getFont():getWidth(buttonText)
		love.graphics.print(buttonText, x+w/2-t/2, y+h/3)
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
				s:play()
				event(value)
				self.buttonPressToggle = 0
			end
		end
		love.graphics.setColor(pc[1], pc[2], pc[3])
	end
	-- Button with image
	function self.ButtonImageEvent(x,y, pc, w, h, event, value, image)-- Button (x position button, y position button, primarycolor, button text, width, height, button event)
		love.graphics.draw(image, x, y)
		-- button hitbox
		if love.mouse.isDown(1) and love.mouse.getX() >= x and love.mouse.getX() <= x+w and love.mouse.getY() >= y and love.mouse.getY() <= y+h then
			self.buttonPressToggle = 2
		end
		-- to prevent when button held down
		if self.buttonPressToggle == 2 then
			if love.mouse.isDown(1) ~= true then
				s:play()
				event(value)
				self.buttonPressToggle = 0
			end
		end
	end
	
	function self.changeToggle(a)
		self.buttonPressToggle = a
		love.graphics.print(a, 80, 80)
	end
	function self.addToggle(a) self.buttonPressToggle = self.buttonPressToggle + a end
	
	return self
end

return api

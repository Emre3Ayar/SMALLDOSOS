-- Example: Checking if a key is down

local love = require "love"
local myApi = require "MyApi"
local lume = require "lume"

local contact = {}
--local select = false
local selectN=1
--numberData = {0487777310,4,12,17,4,99,04829499,1,14,1,99}
local numberData = {}

--keyboard
local keyboardInput=0
local keyboard_txt=""
local keyboardNumber=0
local keyboardName=""
local text=""

local displayName=""
local displayName2=""
local displayName3=""
local displayName4=""
local displayName5=""
local displayNumber=0

--Color settings
primaryColor={52, 57, 90}
BackgroundColor={50,128,204}

--Sound
s = love.audio.newSource("SFXC.wav")

function contact.load()
	-- loading data
	if love.filesystem.isFile("save.txt") then
		file = love.filesystem.read("save.txt")
		numberData = lume.deserialize(file)
	end   
    displayName = myApi.getTelefonData(numberData,selectN)
	displayName2 = myApi.getTelefonData(numberData,selectN+1)
	displayName3 = myApi.getTelefonData(numberData,selectN+2)
	displayName4 = myApi.getTelefonData(numberData,selectN+3)
	displayName5 = myApi.getTelefonData(numberData,selectN+4)
end

function contact.draw()
	--Data Display		
	myApi.tColor(10, 10, primaryColor, {0,0,0}, displayName[1])
	myApi.tColor(18, 18, primaryColor, {0,0,0}, displayName[0])
	
	myApi.tColor(10, 30, primaryColor, {0,0,0}, displayName2[1])
	myApi.tColor(18, 38, primaryColor, {0,0,0}, displayName2[0])
	
	myApi.tColor(10, 50, primaryColor, {0,0,0}, displayName3[1])
	myApi.tColor(18, 58, primaryColor, {0,0,0}, displayName3[0])
	
	myApi.tColor(10, 70, primaryColor, {0,0,0}, displayName4[1])
	myApi.tColor(18, 78, primaryColor, {0,0,0}, displayName4[0])
	
	myApi.tColor(10, 90, primaryColor, {0,0,0}, displayName5[1])
	myApi.tColor(18, 98, primaryColor, {0,0,0}, displayName5[0])
	-- Adding person UI
	myApi.smurfWindow(160,30, 130,55, primaryColor) -- window
	--love.graphics.print("Adding person",160, 30) -- window content
	myApi.tColor(160, 30, primaryColor, {0,0,0}, "Adding person")
	love.graphics.print(keyboardName,160,45)-- window content
	love.graphics.print(keyboardNumber,160,55)-- window content
	-- input name,telephone window
	myApi.smurfWindow(160,105, 150,50, primaryColor) -- window
	if keyboardInput%2 ==  0 then
		myApi.tColor(160, 105, primaryColor, {0,0,0}, "Type in telephone number") -- window content
	else
		myApi.tColor(160, 105, primaryColor, {0,0,0}, "Type in name") -- window content
	end
	myApi.inputField(160,120,text) -- window content
	
	--CONFIRM button (using b1, button object from calculator)
	b1.ButtonEvent(160,140, primaryColor, "Confirm", 50,20, contact.confirmButtonEvent,0)
	
	--ADD button (using b2, button object from calculator)
	b2.ButtonEvent(230,140, primaryColor, "Add", 30,20, contact.addButtonEvent, 0)
end

function contact.confirmButtonEvent()
	a={}
	if keyboardInput%2 ==  0 then
		keyboardNumber = text
	else
		keyboardName = text
	end
	text = ""
end

function contact.addButtonEvent()
	a = {keyboardNumber,keyboardName}
	f = myApi.encodeDecode(a, false)
	if #numberData ~= nil then l = #numberData else l = 0 end
	for j=1,#f,1
	do numberData[l+j] = f[j] end
	-- saving data
	serialized = lume.serialize(numberData)
	love.filesystem.write("save.txt", serialized)
	
	displayName = myApi.getTelefonData(numberData,selectN)
	displayName2 = myApi.getTelefonData(numberData,selectN+1)
	displayName3 = myApi.getTelefonData(numberData,selectN+2)
	displayName4 = myApi.getTelefonData(numberData,selectN+3)
	displayName5 = myApi.getTelefonData(numberData,selectN+4)
end

function contact.keypressed(key)
	if key == "up" then -- select person
		s:play()
		selectN=selectN-1
	elseif key == "down" then -- select person
		s:play()
		selectN=selectN+1	
	elseif key == "right" and text=="" then -- select input
		keyboardInput = keyboardInput +1
	elseif key == "left" and text=="" then -- confirm person and add to datalist
		a = {keyboardNumber,keyboardName}
		f = myApi.encodeDecode(a, false)
		if #numberData ~= nil then l = #numberData else l = 0 end
		for j=1,#f,1
		do numberData[l+j] = f[j] end
	elseif key == "return" then
		a={}
		if keyboardInput%2 ==  0 then
			keyboardNumber = text
		else
			keyboardName = text
		end
		--f = myApi.encodeDecode(a,false)
		--if #numberData ~= nil then l = #numberData
		--else
		--	l = 0
		--end

		--for j=1,#f,1
		--do numberData[l+j] = f[j] end
		-- save all data
		--for u=1,#numberData,1
		--do
		--	pmem(u,numberData[u] )
		--end
		--pmem(0, #numberData)
	elseif key == "delete" then
		 myApi.deletePerson(numberData, selectN)
		 -- saving data
		serialized = lume.serialize(numberData)
		love.filesystem.write("save.txt", serialized)
	end
	-- delete character from inputfield
	if key == "backspace" then 
		text = string.sub(text, -#text, #text-1)
	end
	-- display (control)

	displayName = myApi.getTelefonData(numberData,selectN)
	displayName2 = myApi.getTelefonData(numberData,selectN+1)
	displayName3 = myApi.getTelefonData(numberData,selectN+2)
	displayName4 = myApi.getTelefonData(numberData,selectN+3)
	displayName5 = myApi.getTelefonData(numberData,selectN+4)
	--keyboard_txt = keyboard_txt + string.format(key)
end

function contact.keyreleased(key, code)

end

function contact.textinput(t) -- keyboard
	text = text..t
end

function contact.update()
	-- select = false
end

return contact

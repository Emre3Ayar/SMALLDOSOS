
local love = require "love"
local myApi = require "MyApi"

local seq = {}
--Color settings
primaryColor={52, 57, 90}
BackgroundColor={50,128,204}
buttonColor = {234, 196, 91}

t = 0
seqStart = false
ss = love.audio.newSource("B1.wav")

seq1 = 0
seq2 = 1
tempo = 0
speed = 1

sequence = 1
sequenceLength = {0,0,0,0}
function seq.load()

end

function seq.draw()
	love.graphics.print("BPM: ".. tempo, 10,10)
	love.graphics.print("TICK: ".. sequence%4+1, 10,30)
	love.graphics.setColor(234, 196, 91)
	love.graphics.rectangle("fill", 30,80, 200,200)
	
	--Sequence indicators
	for i=1,#sequenceLength,1
	do
		if sequence%#sequenceLength+1  == i then
			love.graphics.setColor(120, 182, 77)
			love.graphics.rectangle("fill", 80*(i/2),100, 20,20)
		else
			love.graphics.setColor(220, 182, 77)
			love.graphics.rectangle("fill", 80*(i/2),100, 20,20)
		end
		love.graphics.setColor(234, 196, 91)
	end
		
	--buttons
	b1.ButtonEvent(60,10, buttonColor, "INC", 20,20, seq.inc, 1)
	b2.ButtonEvent(90,10, buttonColor, "DEC", 20,20, seq.dec, 1)
	
	b3.ButtonEvent(200,10, buttonColor, "Sound", 20,20, seq.changeSound, 1)
	b4.ButtonEvent(200,40, buttonColor, "Sound", 20,20, seq.changeSound, 2)
	b5.ButtonEvent(240,10, buttonColor, "Sound", 20,20, seq.changeSound, 3)
	--if seqStart == true then
	--	t = t + 1 / 100
	--end
end

function seq.inc()
	speed = speed+0.1
end

function seq.dec()
	speed = speed-0.1
end

function seq.changeSound(x)
	if x == 1 then
		ss = love.audio.newSource("B1.wav")
	elseif x == 2 then
		ss = love.audio.newSource("B2.wav")
	elseif x == 3 then
		ss = love.audio.newSource("B3.wav")
	end
end

function seq.beat()
	sequence = sequence+1
	ss:stop()
	ss:play()
end

function seq.keypressed(key)
	if key == "space" then 
		seqStart = not seqStart
	end
end

function seq.update(dt)
	t = t + dt * speed
	tempo = 60 * speed
	seq1 = math.floor(t)
	if seq1 ~= seq2 then
		seq.beat()
		seq2 = seq1
	end
end

return seq

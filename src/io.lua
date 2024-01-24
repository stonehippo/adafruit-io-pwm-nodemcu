-- get credentials and topic
dofile("io_secrets.lua")

-- use GPIO2 for pwm 
p=4
pwm.setup(p,1000,0)
pwm.start(p)

function check(data)
	local value = tonumber(data)
	if value == nil then return nil
	elseif value > 1023 or value < 0 then return nil
	else return value end
end

-- set up MQTT event callbacks, connect and subscribe
m=mqtt.Client(cid,120,uid,pwd)
m:on("connect",function(client) print("connect") end)
m:on("offline",function(client) print("offline") end)
m:on("message",function(client,topic,data)
	local value = check(data)
	if value ~= nil then
		print("set pwm:"..data)
		pwm.setduty(p,data)
		print("pwm:"..pwm.getduty(p))
	end
end)

m:connect("io.adafruit.com",8883,1,
	function(client)
		print("connected")
		m:subscribe(topic,0,function(client) print("subscribed") end)
	end,
	function(client,reason) print("connection failed:"..reason) end) 

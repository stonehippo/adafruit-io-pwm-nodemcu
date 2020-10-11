function boot()
	if file.open("init.lua") == nil then
		print("init.lua not present; halting boot")
	else
		file.close("init.lua")
		dofile("app.lua")
	end
end

dofile("net.lua")
tmr.alarm(1,1000,1, function()
	if wifi.sta.getip() == nil then
		print("Connecting to Wifi...")
	else
		tmr.stop(1)
		print("Wifi connected")
		print("5 seconds to delete or rename init.lua to halt")
		tmr.alarm(0,5000,0,boot)
	end
end)

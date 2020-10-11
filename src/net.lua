-- load credentials
dofile("net_secrets.lua")

print("Connecting to Wifi network "..ssid)

wifi.setmode(wifi.STATION,false)
sta_cfg={}
sta_cfg.ssid=ssid
sta_cfg.pwd=wifi_pwd
wifi.sta.config(sta_cfg)


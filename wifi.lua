-- wifi.lua
-- Uit het boek Zelf een IoT toepassing maken
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

-- NodeMCU onthoudt de wifi instellingen in het flash geheugen
-- dus eenmalig draaien voldoende

-- Mechanisme voor wifi instellingen is gewijzigd
wifi.setmode(wifi.STATION)
station_cfg = {}
station_cfg.ssid = "EIGENWIFINAAM"
station_cfg.pwd = "WIFIWACHTWOORD"
station_cfg.save = true
wifi.sta.config(station_cfg)
wifi.sta.connect()

-- Gebruik de volgende instructies in de console om wifi verbindingen te controleren
-- print(wifi.sta.status()) -- Status 5 is A-OK
-- print(wifi.sta.getip())

-- Probeer iedere 30 seconden verbinding met het internet te maken
-- Informatie over het gebruik van de webhook in de README.MD
tmr.alarm(6, 30000, tmr.ALARM_AUTO, function() 
  if wifi.sta.status() == 5 then
    http.get("http://maker.ifttt.com/trigger/testwifi/with/key/cKOv_7WOkun-XfI22a5Duw-yhCiJF61C-dn4NvuU-LI?value1=" .. wifi.sta.getmac())
  else
    print("Nog geen verbinding met het internet. Controleer de instellingen.")
  end
end)

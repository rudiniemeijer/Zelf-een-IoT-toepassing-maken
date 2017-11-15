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

-- testwifi.lua
-- Uit het boek Zelf een IoT toepassing maken
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

-- NodeMCU onthoudt de wifi instellingen in het flash geheugen
-- dus eenmalig draaien voldoende

-- Mechanisme voor wifi instellingen is gewijzigd
wifi.setmode(wifi.STATION)
station_cfg = {}
station_cfg.ssid = "JOUWSSID"
station_cfg.pwd = "JOUWWACHTWOORD"
station_cfg.save = true
wifi.sta.config(station_cfg)
wifi.sta.connect()

LEDPIN1 = 0 -- D0 op NodeMCU printplaat
LEDPIN2 = 4 -- D4 op NodeMCU printplaat

gpio.mode(LEDPIN1, gpio.OUTPUT) -- Set LEDPIN1 as output
gpio.mode(LEDPIN2, gpio.OUTPUT) -- Set LEDPIN2 as output

-- Probeer iedere 30 seconden verbinding met het internet te maken
-- Informatie over het gebruik van de webhook in de README.MD
tmr.alarm(6, 30000, tmr.ALARM_AUTO, function() 
  if wifi.sta.status() == 5 then
    gpio.write(LEDPIN1, gpio.LOW)  -- led aanzetten
    tmr.alarm(3, 500, tmr.ALARM_SINGLE, function ()
      gpio.write(LEDPIN1, gpio.HIGH)
    end)
    print("Er is verbinding met het internet: "..wifi.sta.getip())
    http.get("http://maker.ifttt.com/trigger/testwifi/with/key/pWixgavdPXBK6n6vbjWr3xJZoc7V_hDY8NdNIs8Wq68?value1=" .. wifi.sta.getmac())
  else
    gpio.write(LEDPIN2, gpio.LOW)  -- led aanzetten
    tmr.alarm(3, 500, tmr.ALARM_SINGLE, function ()
      gpio.write(LEDPIN2, gpio.HIGH)
    end)
    print("Nog geen verbinding met het internet. Controleer de instellingen.")
  end
end)

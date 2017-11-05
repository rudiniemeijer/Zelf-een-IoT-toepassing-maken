-- resistancetothingspeak.lua
-- Uit het boek Zelf een IoT toepassing maken
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

-- Verander dit
DE_API_SLEUTEL = "verander deze tekst in de API sleutel van het ThingSpeak kanaal"

-- Verander dit niet
URL = "http://api.thingspeak.com/update?api_key="..DE_API_SLEUTEL

function meet() 
  s = adc.read(0)
  print("Gemeten waarde van S is "..s)
  if wifi.sta.status() == 5 then
    http.get(URL.."&field1="..s)
  else
    print("Geen IP adres. Gebruik wifi.sta.config() eerst en controleer de verbinding.")
  end
end

tmr.alarm(3, 5000, tmr.ALARM_AUTO, meet) -- meet iedere 5 seconden

-- soiltoifttt.lua
-- Uit het boek Zelf een IoT toepassing maken
-- Copyright (c) 2018 Rudi Niemeijer
-- MIT license

ledpin = 0
gpio.mode(ledpin, gpio.OUTPUT)

-- Maak op IFTTT.com een Applet aan met als ingang een webrequest van het type Webhook ('this')
-- kies als actie het toevoegen van een rij aan een Google spreadsheet ('that')
-- Pas dit aan
APPLET = "vervang deze tekst door de naam van applet"
DE_API_SLEUTEL = "zet hier de API sleutel van IFTTT"

-- Pas dit niet aan
URL = "http://maker.ifttt.com/trigger/"..APPLET.."/with/key/"..DE_API_SLEUTEL

function meting()
  print(tmr.time() .. "Grond sensor meting")
  gpio.write(ledpin, gpio.LOW)                      -- gpio.LOW is led AAN
  if wifi.sta.status() == 5 then                    -- valide IP adres?
    tmr.alarm(0, 500, tmr.ALARM_SINGLE,
    function()                                      -- led uit na 0,5 seconden
      gpio.write(ledpin, gpio.HIGH)                 -- gpio.HIGH is led UIT
    end)
    http.get(URL.."?value1="..adc.read(0))
    print(URL.."?value1="..adc.read(0))
  else
    print("Geen IP adres. Gebruik wifi.sta.config() en controleer de verbinding")
    tmr.alarm(0, 2000, tmr.ALARM_SINGLE, function() -- Led uit na 2 seconden
      gpio.write(ledpin, gpio.HIGH)                 -- gpio.HIGH is led UIT
    end)
  end
end

tmr.alarm(4, 180000, tmr.ALARM_AUTO, meting) -- Iedere 30 seconden een meting

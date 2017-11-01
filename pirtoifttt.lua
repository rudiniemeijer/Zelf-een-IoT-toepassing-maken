-- pirtoifttt.lua
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

ledpin, pirsensorpin = 4, 2
gpio.mode(pirsensorpin, gpio.INT, gpio.PULLUP)
gpio.mode(ledpin, gpio.OUTPUT)

-- Pas dit aan
APPLET = "vervang deze tekst door de naam van applet"
DE_API_SLEUTEL = "zet hier de API sleutel van IFTTT"

-- Pas dit niet aan
URL = "http://maker.ifttt.com/trigger/"..APPLET.."/with/key/"..DE_API_SLEUTEL

function beweging()
  print(tmr.time() .. "PIR sensor detecteerde beweging")
  gpio.write(ledpin, gpio.LOW)                      -- gpio.LOW is led AAN
  if wifi.sta.status() == 5 then                    -- Valide IP addres?
    tmr.alarm(0, 500, tmr.ALARM_SINGLE, function()  -- Led uit na 0,5 seconden
      gpio.write(ledpin, gpio.HIGH)                 -- gpio.HIGH is led UIT
    end)
    http.get(URL.."?value1="..tmr.time())
    print(URL.."?value1="..tmr.time())
  else
    print("Geen IP adres. Gebruik wifi.sta.config() en controleer de verbinding")
    tmr.alarm(0, 2000, tmr.ALARM_SINGLE, function() -- Led uit na 2 seconden
      gpio.write(ledpin, gpio.HIGH)                 -- gpio.HIGH is led UIT
    end)
  end
end

-- Roep de beweging functie aan als het signaal van laag naar hoog gaat ('up')
gpio.trig(pirsensorpin, "up", beweging)             -- Referentie naar de beweging functie

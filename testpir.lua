-- testpir.lua
-- Uit het boek Zelf een IoT toepassing maken
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

ledpin, pirsensorpin = 4, 2
gpio.mode(pirsensorpin, gpio.INT, gpio.PULLUP)
gpio.mode(ledpin, gpio.OUTPUT)

function beweging()
  print(tmr.time() .. "PIR sensor detecteerde beweging")
  gpio.write(ledpin, gpio.LOW)                      -- gpio.LOW is led AAN
  tmr.alarm(0, 2000, tmr.ALARM_SINGLE,
  function()                                        -- led uit na 2 seconden
    gpio.write(ledpin, gpio.HIGH)                   -- gpio.HIGH is led UIT
  end)
end

-- Roep de beweging functie aan als het signaal van laag naar hoog gaat ('up')
gpio.trig(pirsensorpin, "up", beweging)             -- Referentie naar de beweging functie

-- blink.lua
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

wachttijd = 1000 -- ms tussen AAN en UIT
ledpin = 0   -- D0 (er is ook een led op D4)
ledaan = 0   -- status van de led
ledtimer = 1 -- Gebruik timer 1 (kan 0 tot 6 zijn)
gpio.mode(ledpin, gpio.OUTPUT) -- Stel D0 in als uitgang
tmr.alarm(ledtimer, wachttijd, tmr.ALARM_AUTO, function() -- Maak een functie
  if ledaan == 0 then -- was de led net UIT?
    ledaan = 1        -- onthoud dat de led nu AAN is
    gpio.write(ledpin, gpio.LOW)  -- en zet de led AAN
  else
    ledaan = 0        -- onthoud dat de led nu UIT is
    gpio.write(ledpin, gpio.HIGH) -- en schakel de led UIT
  end
end)

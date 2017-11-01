-- testanalog.lua
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

function meet() 
  s = adc.read(0)
  print("Gemeten waarde van S is "..s)
end

tmr.alarm(3, 2000, tmr.ALARM_AUTO, meet) -- meet iedere 2 seconden

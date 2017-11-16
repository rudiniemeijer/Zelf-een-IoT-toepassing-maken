-- dht22.lua
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

ledpin, dhtsensorpin = 4, 2
gpio.mode(ledpin, gpio.OUTPUT)

-- Change this
IFTTT_APPLET = "IFTTT_APPLET_NAME"
IFTTT_API_KEY = "IFTTT_API_KEY"
THS_API_KEY = "THINGSPEAK_API_KEY"
INTERVAL = 10000
HUM_MAX = 80

-- Do not change this
IFTTT_URL = "http://maker.ifttt.com/trigger/"..IFTTT_APPLET.."/with/key/"..IFTTT_API_KEY
THS_URL = "http://api.thingspeak.com/update?api_key="..THS_API_KEY

function readDHT22()
  dht = require("dht")
  local status, temperature, humidity = dht.read(dhtsensorpin)
    if status ~= dht.OK then
      print("DHT Time out or Checksum error")
      temperature = nil
      humidity = nil
    end
    dht = nil
    package.loaded["dht"] = nil
    return temperature, humidity
end

tmr.alarm(5, INTERVAL, tmr.ALARM_AUTO, function() 
  gpio.write(ledpin, gpio.LOW)                    -- gpio.LOW is led ON
  t, h = readDHT22()
  if t ~= nil then
    if wifi.sta.status() == 5 then -- Valid IP address?
      tmr.alarm(0, INTERVAL / 100, tmr.ALARM_SINGLE, function() -- Led off after a short while
        gpio.write(ledpin, gpio.HIGH)                 -- gpio.HIGH is led OFF
      end)
      http.get(THS_URL.."&field1="..t.."&field2="..h)
      print("Sent temperature "..t.." deg C and humidity "..h.."% to ThingSpeak")      
      if h > HUM_MAX then
        http.get(IFTTT_URL.."?value1="..t.."&value2="..h)
        print("Humidity is higher than "..HUM_MAX.." so reached out to IFTTT as well")
      end
    else
      tmr.alarm(0, INTERVAL / 2, tmr.ALARM_SINGLE, function() -- Led off after longer while
        gpio.write(ledpin, gpio.HIGH)                 -- gpio.HIGH is led OFF
      end)
      print("No IP address. Use wifi.sta.config() first")
    end
  end 
end)

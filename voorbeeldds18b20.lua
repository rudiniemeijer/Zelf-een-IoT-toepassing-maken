-- Initialisatie (eenmalig)
ow_pin = 4
ledpin = 4
wifi.setmode(wifi.NULLMODE) --verbreek verbinding
gpio.mode(ledpin, gpio.OUTPUT) -- led klaarzetten voor gebruik
ow.setup(ow_pin)
count = 0
repeat
  count = count + 1
  sensors = ow.reset_search(ow_pin)
  sensors = ow.search(ow_pin)
until (addr ~= nil) or (count > 5) -- Max 5 sensoren

function sample()
  gpio.write(ledpin, gpio.LOW) -- gpio.LOW is led AAN
  t = getSensorValue(sensors)
  if t ~= -1 then
    tmr.alarm(0, 500, tmr.ALARM_SINGLE, function()   -- led uit na 0,5 seconden
      gpio.write(ledpin, gpio.HIGH)                 -- gpio.HIGH is led UIT
    end)
    --print(t, h)
    print(t)
    schrijfdata(t)
  else
    tmr.alarm(0, 2000, tmr.ALARM_SINGLE, function() -- Led uit na 2 seconden
      gpio.write(ledpin, gpio.HIGH)                 -- gpio.HIGH is led UIT
    end)
    print("sample error")
  end
end

function schrijfdata(t)
  file.open("tempwaardenhoef.txt", "a+")
  file.writeline(t)
  file.close()
end

function getSensorValue(sensorAddress)
    t1 = -1
    if sensorAddress ~= nil then
        --print(addr:byte(1,8))
        crc = ow.crc8(string.sub(sensorAddress,1,7))
        if crc == sensorAddress:byte(8) then
            if (sensorAddress:byte(1) == 0x10) or (sensorAddress:byte(1) == 0x28) then
                --print("Device is a DS18S20 family device.")
                ow.reset(ow_pin)
                ow.select(ow_pin, sensorAddress)
                ow.write(ow_pin, 0x44, 1)
                tmr.delay(1000000) -- One second
                present = ow.reset(ow_pin)
                ow.select(ow_pin, sensorAddress)
                ow.write(ow_pin,0xBE,1)
                --print("P="..present)  
                data = nil
                data = string.char(ow.read(ow_pin))
                for i = 1, 8 do
                    data = data .. string.char(ow.read(ow_pin))
                end
                --print(data:byte(1,9))
                crc = ow.crc8(string.sub(data,1,8))
                --print("CRC="..crc)
                if crc == data:byte(9) then
                    t = (data:byte(1) + data:byte(2) * 256) * 625
                    t1 = t / 10000
                end
            end                   
        end
    end
    return t1
end

tmr.alarm(1, 10000, tmr.ALARM_AUTO, sample)
print(getSensorValue(sensors))

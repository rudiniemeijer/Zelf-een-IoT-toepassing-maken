pir = 2 -- D2
gpio.mode(pir, gpio.INPUT)
tmr.alarm(1, 1000, -- nr1, 1000ms
  tmr.ALARM_AUTO, -- herhaal
  function()
    if gpio.read(pir) == 1 then
      print("signaal hoog")
    end
  end
)

pir = 2 -- D2
gpio.mode(pir, gpio.INT, gpio.PULLUP)
gpio.trig(pir, "up",
  function()
    print("signaal hoog")
  end
)

# Inleiding in Lua

## Variabelen en typeringen  
    variabele = waarde  
    local a = 10  
    b = true  
    c = false  
    d = nil  
    e, f, g = 5, "hallo", 6.1  

## Operatoren
    or
    and
    <  >  <=  >=  ~=  ==  ..
    +  -
    *  /  %
    not   #   -
    ^

## Voorwaardelijke lussen
    while i <= 5 do
    end
    
    repeat
      break
    until i > 10
    
    for i = 1, 10, 2 do
    end

## Functies
    function doedit()
      local x, y = doedat(4, 5)
      return x^y
    end
    
    function doedat(a1, a2)
      return a1*2, a2*3
    end

## Tabellen
    x = 5
    a = {}
    b = {sl1 = x, sl2 = 3}
    
    a[1] = 20
    
    print(a[1])

## Strings
    s = "Hallo wereld"
    print(#s) -- 15
    
    t = "123" .. 4 .. "56"
    
## Getallen en berekeningen
    a = 3.1415926
    b = a * 2
    
    c = node.random() -- 0..1
    d = node.random(10) -- 1..10

## Bestanden
    file.open("waarden.txt")
    file.write(1)
    file.write(2)
    file.writeln(3)
    file.close
    file.open("anderewaarden")
    a = {}
    a = file.readline()
    file.close()

## Input en output
    gpio.mode(1, gpio.INPUT, gpio.PULLUP)
    if gpio.read(1) then
      print("hoog signaal")
    else
      print("laag signaal")
    end
    print(adc.read(0))

# Timers en gebeurtenissen
    tmr.delay(1000)
    start = tmr.now()
    
    tmr.alarm(0, 1000,
      tmr.ALARM_AUTO,
      function()
        print("hallo")
      end)

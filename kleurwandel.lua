-- kleurwandel.lua
-- Ondersteunend programma bij het boek Zelf een IoT toepassingmaken
-- 1e druk, ISBN 
-- Copyright (c) 2017 Testconsultancy Groep
-- Op dit programma is de MIT Open Source licentie van toepassing
 
leds = 4 -- Aantal leds, index 1..leds
kleuren = 3 -- RGB
onled = 1 -- Huidge led
ki = 0 -- Kleurindex in bereik [0..1]
ks = 0.01 -- Kleurstap
richting = 1

ws2812.init(ws2812.MODE_SINGLE) -- D4/GPIO2
disp = ws2812.newBuffer(leds, kleuren)

function kleur(h)
  local r, g, b = 0, 0, 0

  if h < 1 / 3 then
    r = 2 - h * 6
    g = h * 6
    b = 0
  elseif h < 2 / 3 then
    r = 0
    g = 4 - h * 6
    b = h * 6 - 2
  else
    r = h * 6 - 4
    g = 0
    b = (1 - h) * 6
  end
  if r > 1 then
    r = 1
  end
  if g > 1 then
    g = 1
  end
  if b > 1 then
    b = 1
  end
  r = r * 255
  g = g * 255
  b = b * 255
  return string.char(r, g, b)
end

function display()
  disp:fill(0, 0, 0) -- hele display zwart maken

  disp:set(onled, kleur(ki))
  
  onled = onled + richting
  if onled > leds then
    onled = leds
    richting = -1
  end
  if onled < 1 then
    onled = 1
    richting = 1
  end

  ki = ki + ks
  if ki > 1 then
    ki = 0
  end

  disp:set(onled, kleur(ki))

  ws2812.write(disp) -- stuur leds aan
end

tmr.alarm(1, 50, tmr.ALARM_AUTO, display)

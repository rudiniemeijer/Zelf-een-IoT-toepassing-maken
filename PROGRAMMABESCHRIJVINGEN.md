# Programmabeschrijvingen

## [wifi.lua](wifi.lua) en [testwifi.lua](testwifi.lua)
Met `wifi.lua` worden de instellingen voor wifi verbindingen met het internet ingesteld. Wifi instellingen worden lokaal op de NodeMCU bewaard en daarom is het niet nodig om vaker dan 1 keer de wifi verbinding in te stellen. `testwifi.lua` doet hetzelfde, maar bevat enkele controles voor als het verbinden met wifi niet direct lukt.
## [blink.lua](blink.lua)
Dit Lua programma laat de led D0 op de NodeMCU met tussenpozen van 1 seconde knipperen.
## [testpir.lua](testpir.lua) en [pirtoifttt.lua](pirtoifttt.lua)
Met `testpir.lua` is eenvoudig te testen of een PIR sensor op de juiste manier op de NodeMCU is aangesloten. `pirtoifttt.lua` maakt verbinding met het internet en roept via een webhook een applet op IFTTT aan. Deze applet kan vervolgens een actie naar wens uitvoeren, zoals het versturen van een Twitter bericht.
## [testanalog.lua](testanalog.lua) en [resistancetothingspeak.lua](resistancetothingspeak.lua)
Met `testanalog.lua` wordt de (enige) analoge poort van de NodeMCU uitgelezen en wordt de waarde op het scherm getoond. `resistancetothingspeak.lua` maakt verbinding met het internet en stuurt via een webhook de gemeten waarde van de analoge poort naar ThingSpeak.
## [kleurwandel.lua](kleurwandel.lua)
`kleurwandel.lua` stuurt één of meerdere WS2812 leds aan in een rupsachtig wandelpatroon waarbij de kleur van de leds langzaam door het kleurspectrum verloopt. De ingang van de (eerste) WS2812 led wordt op D4 aangesloten, de (+) en (-) worden op de Vin en GND van de NodeMCU aangesloten. De NodeMCU kan stroom leveren voor ongeveer 20 ws2812 leds.
## [dht22.lua](dht22.lua)

# Vereiste modules voor de programma's
| programma         | vereiste modules |
| ---------         | ---------------- |
| wifi.lua          | wifi |
| testwifi.lua      |  wifi, http |

# Zelf-een-IoT-toepassing-maken
Programma's en codevoorbeelden uit het boek

## wifi.lua
Met dit Lua programma worden de instellingen voor wifi verbindingen met het internet ingesteld. Wifi instellingen worden lokaal op de NodeMCU bewaard en daarom is het niet nodig om vaker dan 1 keer de wifi verbinding in te stellen.

## blink.lua
Dit Lua programma laat de led D0 op de NodeMCU met tussenpozen van 1 seconde knipperen.

## testpir.lua
Met dit Lua programma is eenvoudig te testen of een PIR sensor op de juiste manier op de NodeMCU is aangesloten.

## pirtoifttt.lua
Dit Lua programma maakt verbinding met het internet en roept via een webhook een applet op IFTTT aan. Deze applet kan vervolgens een actie naar wens uitvoeren, zoals het versturen van een Twitter bericht.

## testanalog.lua
Hiermee wordt de (enige) analoge poort van de NodeMCU uitgelezen en wordt de waarde op het scherm getoond.

## resistancetothingspeak.lua
Dit Lua programma maakt verbinding met het internet en stuurt via een webhook de gemeten waarde van de analoge poort naar ThingSpeak.

# Drivers en programmeeromgeving

# Nieuwe firmware laden

# Beginnen met de NodeMCU
_Een NodeMCU is een kleine computer met allerlei in- en uitgangen die eenvoudig met het internet is te verbinden. Je kunt een NodeMCU herkennen aan de micro-USB aansluiting aan de ene kant en een wifi-antenne op de andere kant. Het printplaatje heeft afmetingen van ongeveer 5 x 2,5 cm. Je programmeert de NodeMCU met instructies in de taal Lua, wat 'maan' betekent in het Portugees. Met deze tips gaat dat lukken._

## Wat heb je nodig
* Een NodeMCU
* Een micro-USB kabeltje
* Een Windows- of OS X computer (Linux kan ook, maar het gebruik daarvan beschrijven we hier niet)
* Beschikking over een wifi toegangspunt

Verder is een breadboard met minimaal 400 gaatjes handig en draadjes waarmee je gemakkelijk op het breadboard verbindingen kunt maken. Op je Windows- of OS X computer moet een USB-driver voor de NodeMCU worden geïnstalleerd. Ook moet de ESPlorer programmeeromgeving worden gedownload. Om deze te kunnen gebruiken is Java nodig, die meestal al wel op de computer staat. Al deze genoemde software is gratis.

### Beschrijving van het blokschema van de NodeMCU
De NodeMCU heeft een USB-naar-serieel omzettingschip (rechts op het blokschema weergegeven). 

<img alt="Blokschema van de NodeMCU" src="https://github.com/rudiniemeijer/zelf-een-iot-toepassing-maken/blob/master/nodemcu-blokschema.jpg" width="350">

### Downloaden van de juiste driver voor de NodeMCU
NodeMCU's hebben een kleine USB conversiechip. Het merk en type hiervan bepaalt, welke USB driver je nodig hebt voor je NodeMCU. De NodeMCU's van fabrikant Amica maken gebruik van de 'SLAB' driver. De NodeMCU's van fabrikant DoIT maken gebruik van de '' driver. Het merk van de NodeMCU staat op de achterkant.

### Downloaden van de programmeeromgeving
De gebruikte programmeeromgeving heet 'ESPlorer'. Deze programmeeromgeving kun je <a href="https://esp8266.ru/esplorer-latest/?f=ESPlorer.zip">hier</a> downloaden. De download komt als .zip bestand, die uitgepakt een enkele <code>esplorer.jar</code> bevat. 

## Verbinding maken met de NodeMCU
Je NodeMCU wordt op een stukje schuim geleverd. Het schuim zorgt ervoor dat de aansluitpennen van de NodeMCU niet buigen en niet per ongeluk kortsluiting maken. Als je iets op je NodeMCU wilt aansluiten dan is het nodig een breadboard te gebruiken. Hieronder zie je een NodeMCU die op een breadboard is geprikt.

<img alt="Afbeelding van een NodeMCU op een breadboard" src="https://github.com/rudiniemeijer/zelf-een-iot-toepassing-maken/blob/master/nodemcu-op-breadboard.jpg" width="350">

Met een micro-USB kabeltje voorzie je de NodeMCU (en alles wat er op is aangesloten) van stroom. Ook kun je zo de NodeMCU programmeren. In de volgende paragraaf wordt uitgelegd hoe je met de programmeeromgeving werkt.

## Werken met de programmeeromgeving
Nadat je je NodeMCU hebt aangesloten op je computer is het tijd om de programmeeromgeving te openen. 

## Je eerste programma op de NodeMCU
Met het programma <code>blink.lua</code> laat je een ingebouwde led op de NodeMCU knipperen. Je controleert met dit programma of je alles goed op je computer hebt geïnstalleerd en ziet gelijk je NodeMCU werken.

## Je NodeMCU met het internet verbinden

## Een sensor aansluiten op je NodeMCU

## Gebruik maken van de kracht van het internet
Je NodeMCU kan heel eenvoudig een webpagina opvragen met de instructie `http.get("http://adres-van-de-webpagina")`. Sommige webpagina's voeren taken voor je uit, voordat ze de pagina tonen. Ze kunnen bijvoorbeeld een twitterbericht voor je versturen, of namens jou een email verzenden. Zo'n taak-uitvoerende-website is het gratis <a href="http://www.ifttt.com">IFTTT.com</a>, wat voor _IF_ _This_ _Then_ _That_ staat ("als dit, dan dat"). Je kunt met IFTTT instellen dat als je er een speciale pagina (je noemt dat een _websocket_) opvraagt, IFTTT voor jou een activiteit uitvoert. Je maakt, zoals IFTTT het noemt, een _applet_. Het adres van die speciale pagina kopieer je in je NodeMCU. Nu kan de NodeMCU op ieder moment de applet aanroepen, bijvoorbeeld als er een nieuwe sensorwaarde beschikbaar is.

Een andere gratis taak-uitvoerende-website is <a href="http://www.thingspeak.com">ThingSpeak.com</a>. ThingSpeak bewaart sensorgegevens voor je en maakt er mooie grafieken van. Je kunt nieuwe sensorwaarden ook weer met de `http.get` instructie verzenden, waarbij de verschillende sensorwaarden in de URL worden meegegeven.

* <small>Download de USB driver voor de NodeMCU voor <a href="">Windows</a> of voor <a href="">OS X</a></small>
* <small><a href="https://www.java.com/en/download/installed.jsp">Controleer of Java op je computer staat</a></small>
* <small><a href="https://esp8266.ru/esplorer-latest/?f=ESPlorer.zip">Download de ontwikkelomgeving ESPlorer</a></small>






# Beginnen met de NodeMCU<img src="https://github.com/rudiniemeijer/zelf-een-iot-toepassing-maken/blob/master/nodemcu-illustratie.jpg" width="400" align="right">
_Een NodeMCU is een kleine computer met allerlei in- en uitgangen die eenvoudig met het internet is te verbinden. Je kunt een NodeMCU herkennen aan de micro-USB aansluiting aan de ene kant en een wifi-antenne op de andere kant. Het printplaatje heeft afmetingen van ongeveer 5 x 2,5 cm. Je programmeert de NodeMCU met instructies in de taal Lua, wat 'maan' betekent in het Portugees. Met deze tips gaat dat lukken._

## Wat heb je nodig
* Een NodeMCU
* Een micro-USB kabeltje
* Een Windows- of OS X computer (Linux kan ook, maar het gebruik daarvan beschrijven we hier niet)
* Beschikking over een wifi toegangspunt

Verder is een breadboard met minimaal 400 gaatjes handig en draadjes waarmee je gemakkelijk op het breadboard verbindingen kunt maken. Op je Windows- of OS X computer moet een USB-driver voor de NodeMCU worden geïnstalleerd. Ook moet de ESPlorer programmeeromgeving worden gedownload. Om deze te kunnen gebruiken is Java nodig, die meestal al wel op de computer staat. Alle genoemde software is gratis. Onderaan deze pagina vind je links naar software die je kunt downloaden.

### Beschrijving van het blokschema van de NodeMCU
Een NodeMCU heeft vier belangrijke onderdelen: een spanningsregulator van 5 naar 3,3 volt, een USB naar serieel conversiechip, een microcontroller van het type ESP8266 en een 4 MB groot flashgeheugen voor de Lua interpreter, de firmware en jouw eigen programma's. Het geheugen is groot genoeg voor tientallen programma's, die elkaar kunnen aanroepen.

<img alt="Blokschema van de NodeMCU" src="https://github.com/rudiniemeijer/zelf-een-iot-toepassing-maken/blob/master/nodemcu-blokschema.jpg" width="350">

In het midden van het blokschema is de microcontroller getekent. Dit is een klein chipje van 5 x 5 mm dat samen met het flashgeheugen onder het metalen dekseltje op de NodeMCU zit. In het chipje zit wifi, een moderne microprocessor, de aansluitingen voor sensoren en actuatoren, een 'Real Time Clock' en de communicatiepoort die met de USB omzetter is verbonden.

Het flashgeheugen bevat in elk geval een bootloader en de NodeMCU firmware. Met de bootloader is het mogelijk om nieuwe, verbeterde NodeMCU firmware te laden. Ook zit er in het flashgeheugen een 'SPIFFS': een bestandssysteem dat ervoor zorgt dat je je programma's kunt opslaan, maar ook dat je vanuit je programma's eenvoudig gegevens kunt bewaren.

### Downloaden van de juiste driver voor de NodeMCU
NodeMCU's hebben een kleine USB conversiechip. Het merk en type hiervan bepaalt, welke USB driver je nodig hebt voor je NodeMCU. De NodeMCU's van fabrikant Amica maken gebruik van de 'SLAB' driver. De NodeMCU's van fabrikant DoIT maken gebruik van de '' driver. Het merk van de NodeMCU staat op de achterkant.

### Downloaden van de programmeeromgeving
De gebruikte programmeeromgeving heet 'ESPlorer'. Deze programmeeromgeving kun je <a href="https://esp8266.ru/esplorer-latest/?f=ESPlorer.zip">hier</a> downloaden. De download komt als .zip bestand, die uitgepakt een enkele <code>esplorer.jar</code> bevat. 

## Verbinding maken met de NodeMCU
Je NodeMCU wordt op een stukje schuim geleverd. Het schuim zorgt ervoor dat de aansluitpennen van de NodeMCU niet buigen en niet per ongeluk kortsluiting maken. Als je iets op je NodeMCU wilt aansluiten dan is het nodig een breadboard te gebruiken. Hieronder zie je een NodeMCU die op een breadboard is gedrukt. Je ziet dat er boven en onder de NodeMCU een gaatjesrij is vrijgehouden. Hier kun je een draadje inprikken om verbindingen te maken met bijvoorbeeld een sensor.

<img alt="Afbeelding van een NodeMCU op een breadboard" src="https://github.com/rudiniemeijer/zelf-een-iot-toepassing-maken/blob/master/nodemcu-op-breadboard.jpg" width="350">

Met een micro-USB kabeltje voorzie je de NodeMCU (en alles wat er op is aangesloten) van stroom. Ook kun je zo de NodeMCU programmeren. In de volgende paragraaf wordt uitgelegd hoe je met de programmeeromgeving werkt.

## Werken met de programmeeromgeving
(beschrijf hier hoe je begint te werken met de programmeeromgeving ESPlorer) 

## Je eerste programma op de NodeMCU
Met het programma <code>blink.lua</code> laat je een ingebouwde led op de NodeMCU knipperen. Je controleert met dit programma of je alles goed op je computer hebt geïnstalleerd en ziet gelijk je NodeMCU werken.

(beschrijf hier hoe je blink download, de code in de programmeeromgeving kopieert, het programma opslaat en hoe je kunt zien dat het programmeren is geslaagd)

## Je NodeMCU met het internet verbinden
(beschrijf hier hoe je de wifi instellingen goed zet en hoe je kunt controleren dat je verbinding met het internet hebt)

## Een sensor aansluiten op je NodeMCU
(beschrijf hier de meest eenvoudige manier om een meting te doen en de resultaten hiervan lokaal, in de ontwikkelomgeving, te bekijken)

## Gebruik maken van de kracht van het internet
Je NodeMCU kan heel eenvoudig een webpagina opvragen met de instructie <code>http.get("http://adres-van-de-webpagina")</code>. Sommige webpagina's voeren taken voor je uit, voordat ze de pagina tonen. Ze kunnen bijvoorbeeld een twitterbericht voor je versturen, of namens jou een email verzenden. 

### If This Then That
Zo'n taak-uitvoerende-website is het gratis <a href="http://www.ifttt.com">IFTTT.com</a>, wat voor _IF_ _This_ _Then_ _That_ staat ("als dit, dan dat"). Je kunt met IFTTT instellen dat als je er een speciale pagina (je noemt dat een _websocket_) opvraagt, IFTTT voor jou een activiteit uitvoert. Je maakt, zoals IFTTT het noemt, een _applet_. Het adres van die speciale pagina kopieer je in je NodeMCU. Nu kan de NodeMCU op ieder moment de applet aanroepen, bijvoorbeeld als er een nieuwe sensorwaarde beschikbaar is. Je kunt die sensorwaarde zelfs meegeven bij het aanroepen van de speciale pagina. Zo kun je bijvoorbeeld een Google spreadsheet met sensorwaarden laten vullen, of IFTTT een slimme thermostaat laten aansturen.

### ThingSpeak
Een andere gratis taak-uitvoerende-website is <a href="http://www.thingspeak.com">ThingSpeak.com</a>. ThingSpeak bewaart sensorgegevens voor je en maakt er mooie grafieken van. Je kunt nieuwe sensorwaarden ook weer met de <code>http.get</code> instructie verzenden, waarbij de verschillende sensorwaarden in de URL worden meegegeven.

* <small>Download de USB driver voor de NodeMCU voor <a href="">Windows</a> of voor <a href="">OS X</a></small>
* <small><a href="https://www.java.com/en/download/installed.jsp">Controleer of Java op je computer staat</a></small>
* <small><a href="https://esp8266.ru/esplorer-latest/?f=ESPlorer.zip">Download de ontwikkelomgeving ESPlorer</a></small>
* <small><a href="https://github.com/rudiniemeijer/Zelf-een-IoT-toepassing-maken/blob/master/wifi.lua">Lua programma om de wifi instellingen goed te zetten</a></small>
* <small><a href="https://github.com/rudiniemeijer/Zelf-een-IoT-toepassing-maken/blob/master/wifi.lua">Lua programma om een led op de NodeMCU te laten knipperen</a></small>






# fae-draussen-ortung

#### Table of Content

* [Function](#Function)
* [Configuration](#Configuration)
* [Run the Service](#Run)

## Function
Der Service simuliert die reale Ortung einer DVP. Hierzu laufen 3 Tracker verschiedene Routen ab.
Ein Tracker ist ein Ortungsgerät, das einer DVP zugeordnet ist. Jeder Tracker wählt zufällig aus 3 Routen. 
Die Bewegungsdaten werden alle 5000ms, dies ist Konfigurierbar, als Event auf dem Message Broker veröffentlicht.
In den folgenden Abbildungen sind die Tracker mit ihren Routen veranschaulicht. 

Solange der Service nicht beendet wird laufen die Tracker weiter und wiederrholen die verschiedenen Routen.

### Tracker 1 
![alt text](https://github.com/Archi-Lab/fae-draussen-ortung/blob/master/assests/route_1.png)

### Tracker 2
![alt text](https://github.com/Archi-Lab/fae-draussen-ortung/blob/master/assests/route_2.png)

### Tracker 3
![alt text](https://github.com/Archi-Lab/fae-draussen-ortung/blob/master/assests/route_3.png)


## Configuration
In der Konfigurationsdatei ``application.properties`` kann zusätzlich die Rate der Event erhöht oder verringert werden.
Hierzu muss der Wert von ``tracker.publishRate`` geändert werden. 
Dieser wird in Millisekunden angeben und ist Standardmäßig auf 5000ms eingestellt.

## Run
Um den Service zu starten und mit kafka zu verbinden muss zuerst das Projekt mit maven gebaut werden.
Hierzu benötigt man den folgenden Befehl: 
```bash
mvn clean package
```
Maven compiliert nun das Projekt, testet es und baut ein docker Image.
Abschließend kann der Service mithilfe eines Scriptes gestartet werden. 
```bash
./start-service-dev.sh
```
Zu beachten hierbei ist das zuerst der Messagebroker gestartet werden muss,
da sonnst ein Fehler in docker erscheint und der Start des Services nicht funktioniert.

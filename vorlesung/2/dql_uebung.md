- [Übungen Datenabfrage](#übungen-datenabfrage)
  - [Verbindung zur Datenbank](#verbindung-zur-datenbank)
  - [Datenmodell und Lizenz](#datenmodell-und-lizenz)
  - [0. Vorbereitung](#0-vorbereitung)
  - [1. Anzahl der Tags](#1-anzahl-der-tags)
  - [2. Laufzeit eines Imports](#2-laufzeit-eines-imports)
  - [3. Joins](#3-joins)
  - [4. Tags einer Übung](#4-tags-einer-übung)

# Übungen Datenabfrage

## Verbindung zur Datenbank

Die folgenden Übungen werden auf einer externen Datenbank durchgeführt.
Sie erhalten die Zugangsdaten in der Vorlesung.

Erstellen Sie eine neue Verbindung in DBeaver wie beim Aufsetzen der Entwicklungsumgebung beschrieben ist.

## Datenmodell und Lizenz

Die Datenbank enthält Übungen und Spiele zu Improvisationstheater.
Alle Datensätze sind unter [CC BY-SA 3.0 DE](https://improwiki.com/de/lizenz) lizenziert und wurden von [Improwiki.com](https://improwiki.com) erhoben.

Übungen und Spiele liegen in der Tabelle `part`. Deren Lizenzinformationen liegen in der `license` Tabelle.
Alle Übungen und Spiele sind mit tags versehen, welche in `tag` aufzufinden sind.

Da ein Tag vielen Übungen zugeordnet sein kann, aber auch eine Übung vielen Tags zugeordnet sein kann, wird diese N:M Beziehung in der `part_tags_tag` Tabelle aufgelöst.

Die `migrations` Tabelle enthält für diese Übung keine wichtigen Informationen.

> Hinweis: sollte der Tabellenname nicht erkannt werden, müssen Sie diesen in Hochkommata (`"`) schreiben.
> Etwa `"tagId"` und nicht `tagId`.

## 0. Vorbereitung

Verbinden sie sich mit der Datenbank und machen Sie sich mit dem Aufbau des Datenmodells bekannt.

1. Geben Sie alle Übungen aus
2. Geben Sie nur die Titel aller Übungen aus
3. Sortieren Sie alle Titel in aufsteigender Reihenfolge (A bis Z)
4. Geben Sie nur alle Tags, welche mit einem E beginnen aus
5. Geben Sie die Anzahl aller Tags, welche mit einem E beginnen aus
6. Geben Sie alle Namen der Tags in Großbuchstaben aus
7. Limitieren Sie das Ergebnis auf zwei Einträge

## 1. Anzahl der Tags

1. Wie viele Übungen mit dem Tag `Reden` gibt es?
2. Geben Sie nun die Titel aller Übungen mit diesem Tag aus
3. Nennen sie das Feld des Titels in `titel_der_uebung` um.
4. Sortieren Sie in absteigender Reihenfolge (Z bis A)

## 2. Laufzeit eines Imports

Die Daten werden mit einem Import-Job in die Datenbank kopiert.

Ermitteln Sie die Dauer des Imports indem Sie die `createdAt` Felder der `part` Tabelle vergleichen.

Tipp: MIN und MAX Befehle können auch auf Daten verwendet werden.

## 3. Joins

1. Fragen Sie die Übung mit dem Titel `Papagei` aus der Datenbank ab
2. Fragen Sie die Lizenz dieser Übung ab
3. Verbinden Sie Lizenz und Übung in einer Abfrage

## 4. Tags einer Übung

1. Fragen Sie die Übung mit dem Titel `Papagei` aus der Datenbank ab
2. Schreiben Sie eine Abfrage, um alle dieser Übung zugeordneten Tags auszugeben
3. Geben Sie ausschließlich die Namen der Tags aus
4. Sortieren Sie die ausgegebenen Tags aufsteigend (A...Z)

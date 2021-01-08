# Übungen

1. Dateneingabe
   - Füge eine SQL Anweisung hinzu, welche zufällige Nummern in die Datenbank hinzufügt
   - Zuerst soll diese durch Java Code produziert werden
   - Ändere den Code dann so ab, dass die Zahl durch SQL generiert wird

1. Integrationsbedingungen
   - Füge eine Nummer nur dann hinzu, wenn diese noch nicht existiert
   - Realisiere dies über eine SQL-Abfrage bevor du Daten hinzufügst
   - Füge der `favorite_number` Tabelle nun eine Integrationsbedingung hinzu, sodass `number` einzigartig sein muss (eventuell musst du die DB löschen)

1. SQL-Injection
   - Schreibe die Abfrage in der `insertData()` als Statement mit dem Format `SELECT * FROM favorite_number WHERE id=1`
   - Der Abfrageparameter id (hier `1`) soll variabel sein
   - Du kannst dies in eine separate Funktion auslagern
   - Überge einen Parameter, welcher bösartiges SQL injiziert (bspw. `DROP TABLE favorite_number`)
   - [Inspiration findest du zum Beispiel hier](https://stackoverflow.com/a/8265319)

1. Fehlerbehandlung
   - Entferne die `throws SQLException` Anweisungen
   - Behandle die Fehler durch einen `try ... catch` Block
   - Beachte das korrekte Schließen der verwendeten Ressourcen

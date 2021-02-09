# Übungen Datendefinition und Datenmanipulation

Legen Sie für die Übungen ein neues Schema in Ihrer lokalen Datenbank an,
damit halten Sie Ihre Datenbank übersichtlich.

Übung 0 ist die Grundlage aller weiteren Übungen. Beginnen Sie mit dieser Übung.

## 0. Mitarbeiterdaten

Erstellen Sie eine Tabelle, um Mitarbeiterdaten zu verwalten. Definieren sie einen entsprechenden Primärschlüssel.
Diese soll die folgenden Spalten enthalten:

- Email
- Geburtsdatum
- Vor- und Nachname
- Lieblingszahl
- Lieblingsfarbe
- Lieblingstier

### 0.1 Testdaten

Fügen Sie drei Mitarbeiterdatensätze hinzu. Dies sind Ihre Testdaten. Verwenden Sie unterschiedliche Werte für die Lieblingszahl.

### 0.2 Datenaktualisierung

1. Aktualisieren Sie die drei Datensätze und ändern Sie mit dem `UPDATE` Befehl alle Lieblingszahlen auf 3.
2. Verwenden Sie den `UPDATE` Befehl, um einen bestimmen Datensatz zu aktualisieren. Welche Felder Sie ändern ist Ihnen freigestellt.
3. Löschen Sie einen Datensatz.

## 1. Standortverwaltung

Der Hauptstandort von Mitarbeitern soll in einer separaten Tabelle gespeichert werden.
Legen Sie hierfür eine zweite Tabelle an und verknüpfen Sie diese mit der existierenden Mitarbeitertabelle.

Achten Sie auf die korrekte Verwendung der Fremd- und Primärschlüssel und finden Sie sinnvolle Spalten für Ihre Standorttabelle.

## 2. Fähigkeiten

Die Fähigkeiten von Mitarbeitern sollen verwaltet werden, um eine Projektverteilung in der Zukunft einfacher zu gestalten.

1. Legen Sie hierfür eine neue Tabelle an, um Fähigkeiten (bspw. agiles Projektmanagement, Datenbankprogrammierung, Gesprächsführung) zu speichern.
2. Jeder Mitarbeiter kann mehrere Fähigkeiten besitzen und jede Fähigkeit kann bei vielen Mitarbeitern existieren.  
   Lösen Sie diese N:M Beziehung auf.
   Ein ER-Diagramm kann Ihnen helfen.
3. Erstellen Sie DDL Befehle, um diese Beziehung in der Datenbank abzubilden.  
   Achten Sie auf die korrekte Verwendung von Fremd- und Primärschlüsseln.

Fügen Sie im Anschluss Datensätze ein, um Ihr Modell zu überprüfen.

## 3. Integritätsbedingungen

Dem Kunden ist es wichtig zusätzliche Bedingungen für einzelne Mitarbeiterfelder vorzunehmen.

Definieren Sie hierfür die folgenden Integritätsbedingungen:

- Die Lieblingszahl muss zweistellig sein!
- Die Email muss eindeutig sein und darf nicht leer sein.
- Das Lieblingstier darf nur Nilpferd, Maulwurf oder Giraffe enthalten oder leer sein.

Fügen Sie im Nachgang verschiedene Datensätze ein, um Ihre Integritätsbedingungen zu verifizieren.

## 4. Migration

Das Schema soll nachhaltig angepasst werden.

Hierfür soll auf der existierenden Tabellendefinition von Übung 0 aufgebaut werden.
Verändern Sie das Schema durch `ALTER` Befehle:

- Das Geburtsdatum soll nicht mehr gespeichert werden. Löschen Sie die Spalte.
- Die Lieblingsfarbe soll umbenannt werden und nun die Farbe der Augen speichern.
- Die Vor- und Nachname Felder dürfen nie leer sein.

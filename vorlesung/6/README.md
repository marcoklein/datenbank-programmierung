# Datendefinition

1. Beschreiben Sie ein ER-Diagramm anhand von SQL-Statements

```sql
CREATE TABLE emp_employee (
    emp_id          SERIAL,
    emp_email       VARCHAR(50),
    emp_fav_num     INTEGER,
    PRIMARY KEY (emp_id)
);
ALTER TABLE emp_employee
	DROP COLUMN emp_fav_num;
```

2. Beschreiben Sie die SQL-Statements für ein ER-Diagramm

# Datenmodifikation

3. Welche Daten können Sie in ein Schema einfügen? (Constraints)
4. Welche Daten sind nach folgendem Skript in der Datenbank?

```sql
CREATE TABLE emp_employee (
    emp_id    INTEGER,
    emp_email    VARCHAR(50) NOT NULL DEFAULT 'noemail@sth.de',
    PRIMARY KEY (emp_id)
);
INSERT INTO emp_employee (emp_id) VALUES (1);
```

# Datenabfrage

1. Was gibt die Query zurück?
2. Schreiben Sie den Join Befehl mit WHERE Syntax um.
3. Was gibt ein LEFT OUTER JOIN, was ein LEFT INNER JOIN zurück?

# JDBC

1. Wie können Sie den folgenden Code robust gestalten?
2. Wie können Sie den folgenden Code sicher gestalten?
3. Ist der folgende Code gegenüber einer SQL-Injection gesichert?

# Rechteverwaltung

1. Welche Rollen haben auf welche Ressourcen zugriff?

```sql
CREATE ROLE sales;
CREATE ROLE emmy WITH INHERIT LOGIN PASSWORD '1234' IN ROLE sales;
GRANT ALL ON ALL TABLES IN SCHEMA company TO sales;
```

2. Beschreiben Sie die Anweisungen um Rechte und Rollen zu definieren.

# Stored Procedures und Funktionen

1. Was macht die folgende Funktion?
2. Verwenden Sie diese in einer Abfrage.

# Transaktionen

Wie verändern sich die Kontostände?

```sql
BEGIN;
UPDATE konto
SET kontostand = kontostand – 400
WHERE kontonr = 4;
UPDATE konto
SET kontostand = kontostand + 400
WHERE kontonr = 7;
ROLLBACK;
UPDATE konto
SET kontostand = kontostand + 400
WHERE kontonr = 7;
COMMIT;
```

# Allgemein

1. Für welche Einsatzgebiete eignen sich Views?
2. Weshalb verwenden Sie objektrelationales Mapping (ORM)?
3. Wann ist die Verwendung eines Index sinnvoll?
4. Wann verwenden Sie einen Key-Value Store, wann eine Graphdatenbank, wann eine Time-Series DB, wann eine Dokumenten DB und wann ein RDBMS?
5. Welche Möglichkeit bietet sich an eine DB zu skalieren?

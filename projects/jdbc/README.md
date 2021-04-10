## Getting Started

Run all commands through a command prompt/terminal in your jdbc folder.

Compile from project folder

```sh
javac ./src/App.java -d ./build
```

- `-d`: Directory of generated class files

Run with

```sh
java -cp "./build;./lib/postgresql-jdbc.jar" App dbpassword
```

For Linux/Mac the `;` should be a `:`.

- `-cp`: Folder of Java classfiles (classpath)
- `App`: Name of main file
- `dbpassword`: Password of database connection (first argument)

## Folder Structure

The workspace contains two folders by default, where:

- `src`: the folder to maintain sources
- `lib`: the folder to maintain dependencies

## Reference

https://www.postgresqltutorial.com/postgresql-jdbc/

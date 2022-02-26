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

## Java in Path

To use Java properly it has to be available in the environment variables.

Run `java -version` to see if you have java properly installed.

On Windows it should get automatically added. On Linux or MacOS you can also use `export PATH=/Applications/<you jdk folder>/Contents/Home/bin:$PATH` to add the path to the JDK into you environment.

Follow the _entwicklungsumgebung.md_ guide to set up your local development setup.

## Folder Structure

The workspace contains two folders by default, where:

- `src`: the folder to maintain sources
- `lib`: the folder to maintain dependencies

## Reference

https://www.postgresqltutorial.com/postgresql-jdbc/

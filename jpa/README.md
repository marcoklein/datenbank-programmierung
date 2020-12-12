## Getting Started

### Create the application.properties

Create a application.properties file in the root of your project that holds all database connection properties.

```
javax.persistence.jdbc.user=<User>
javax.persistence.jdbc.password=<Password>
javax.persistence.jdbc.url=jdbc:postgresql://localhost:5432/postgres
```

### Default Schema

The application uses the default schema of the user. This is per default the `public` schema.

## Folder Structure

The workspace contains two folders by default, where:

- `src`: the folder to maintain sources
- `lib`: the folder to maintain dependencies

## Dependency Management

To ease development the project directly includes external libraries.

- [Persistence Library](https://mvnrepository.com/artifact/javax.persistence/javax.persistence-api/2.2)

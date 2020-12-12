javac -cp "./lib/postgresql-jdbc.jar;./lib/eclipselink.jar;./lib/javax.persistence.jar" ./src/App.java -d ./build
java -cp "./build;./lib/postgresql-jdbc.jar;./lib/eclipselink.jar;./lib/javax.persistence.jar;./src" App

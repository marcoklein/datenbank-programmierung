#!/bin/sh

javac ./src/App.java -d ./build
java -cp "./build:./lib/postgresql-jdbc.jar" App $1
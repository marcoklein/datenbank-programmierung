# Datenbankprogrammierung

Unterstützendes Repository für die Vorlesung.

[Vorlesungen](vorlesung/README.md)

## Struktur

```sh
/projects   # Code Projekte
/vorlesung  # Material der Vorlesung
```

```sh
/scripts  # Scripts for managing the repository (like PDF generation)
```

# About this repository

Subsidiary code repository for a database engineering lecture.

## Render PDFs

The `scripts` folder contains the `generate-pdfs.js` script that collects and renders all Markdown files into PDFs.

You need to install [NodeJS](https://nodejs.org/en/).

Install dependencies

```sh
yarn install
```

Render to PDF files

```sh
yarn generate:pdfs
```

# Datenbankprogrammierung

Unterstützendes Repository für die Vorlesung.

[Vorlesungen](vorlesung/README.md)

## Struktur

```js
/projects   // Code Projekte
/vorlesung  // Material der Vorlesung
```

# About this repository

Subsidiary code repository for a database engineering lecture.

## Render PDFs

You can use [md-to-pdf](https://www.npmjs.com/package/md-to-pdf) to render markdown as PDF documents.
This assumes that you have Node and NPM installed.

```bash
npx md-to-pdf ./path/to/markdown.md
```

Render lecture material

```bash
npx md-to-pdf ./vorlesung/1/ddl_dml.md
npx md-to-pdf ./vorlesung/2/README.md
npx md-to-pdf ./vorlesung/3/README.md
npx md-to-pdf ./vorlesung/4/README.md
npx md-to-pdf ./vorlesung/5/README.md
npx md-to-pdf ./vorlesung/6/README.md
```

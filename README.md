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

## Rendering presentations

This repository uses [Marp](https://yhatt.github.io/marp/) to render Markdown into Slides.

Documents that use marp define the `marp: true` key in the frontmatter.

## Render PDFs

You can use [md-to-pdf](https://www.npmjs.com/package/md-to-pdf) to render markdown as PDF documents.
This assumes that you have Node and NPM installed.

Install globally

```bash
npm i -g md-to-pdf
```

Render lecture material

```bash
md-to-pdf ./vorlesung/1/ddl_dml.md
md-to-pdf ./vorlesung/2/README.md
md-to-pdf ./vorlesung/3/README.md
md-to-pdf ./vorlesung/4/README.md
md-to-pdf ./vorlesung/5/README.md
md-to-pdf ./vorlesung/6/README.md
```

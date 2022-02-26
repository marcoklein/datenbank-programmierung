import { mdToPdf } from "md-to-pdf";

const configs = [
  // generalgeneralgeneralgeneral
  {
    path: "./vorlesung/presentations.md",
    destination: "./pdfs/presentations.pdf",
  },
  // 1
  {
    path: "./vorlesung/1/ddl_dml.md",
    destination: "./pdfs/1_ddl_dml.pdf",
  },
  {
    path: "./vorlesung/1/ddl_dml_uebung.md",
    destination: "./pdfs/1_ddl_dml_uebungen.pdf",
  },
  {
    path: "./vorlesung/1/entwicklungsumgebung.md",
    destination: "./pdfs/entwicklungsumgebung.pdf",
  },
  // 2
  {
    path: "./vorlesung/2/README.md",
    destination: "./pdfs/2_dql.pdf",
  },
  {
    path: "./vorlesung/2/dql_uebung.md",
    destination: "./pdfs/2_dql_uebungen.pdf",
  },
  // 3
  {
    path: "./vorlesung/3/README.md",
    destination: "./pdfs/3_jdbc.pdf",
  },
  {
    path: "./projects/jdbc/uebungen.md",
    destination: "./pdfs/3_jdbc_uebungen.pdf",
  },
  // 4
  {
    path: "./vorlesung/4/README.md",
    destination: "./pdfs/4_transaction_procedures.pdf",
  },
  {
    path: "./vorlesung/4/uebungen.md",
    destination: "./pdfs/4_transaction_procedures_uebungen.pdf",
  },
  // 5
  {
    path: "./vorlesung/5/README.md",
    destination: "./pdfs/5_nosql.pdf",
  },
  {
    path: "./vorlesung/5/uebungen.md",
    destination: "./pdfs/5_nosql_uebungen.pdf",
  },
  // 6
  {
    path: "./vorlesung/6/README.md",
    destination: "./pdfs/6_zusammenfassung.pdf",
  },
];

async function run() {
  for (const config of configs) {
    console.log("Generating pdf for ", config.path);
    await mdToPdf({ path: config.path }, { dest: config.destination });
    console.log(`Wrote pdf for ${config.path} to ${config.destination}`);
  }
}
run();

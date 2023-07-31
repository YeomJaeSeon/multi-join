// 필요한 모듈 가져오기
const mysql = require("mysql2");

const tableInfos = [
  ["main_tb", "sub1_tb1", "sub1_tb2", "sub1_tb3"],
  ["main_tb", "sub2_tb1", "sub2_tb2", "sub2_tb3"],
  ["main_tb", "sub3_tb1", "sub3_tb2", "sub3_tb3"],
];

async function main() {
  for (const tableInfo of tableInfos) {
    for (let j = 0; j < tableInfo.length - 1; j++) {
      const selectTable = tableInfo[j];
      const insertTable = tableInfo[j + 1];

      await insert(selectTable, insertTable);
    }
  }
}

// Function to insert data into the sub1_tb1 table
async function insert(selectTable, insertTable) {
  // Connection configuration
  const connection = mysql.createConnection({
    host: "localhost",
    port: "3399",
    user: "root",
    password: "root",
    database: "blog",
  });

  // Promisify the connection.query method to be used with async/await
  const queryAsync = (query, values) => {
    return new Promise((resolve, reject) => {
      connection.query(query, values, (err, result) => {
        if (err) reject(err);
        else resolve(result);
      });
    });
  };

  try {
    // Connect to the database
    await new Promise((resolve, reject) => {
      connection.connect((err) => {
        if (err) reject(err);
        else resolve();
      });
    });

    console.log("Connected to the database.");

    // Select query
    const selectMainQuery = `SELECT id FROM ${selectTable};`;
    const mainResults = await queryAsync(selectMainQuery);

    const sub1Records = [];
    mainResults.forEach((mainRecord) => {
      for (let i = 1; i <= 5; i++) {
        const sub1Record = [`${insertTable}_name${i}`, mainRecord.id];
        sub1Records.push(sub1Record);
      }
    });

    // Insert query
    const insertSub1Query = `INSERT INTO ${insertTable} (name, ${selectTable}_id) VALUES ?`;
    await queryAsync(insertSub1Query, [sub1Records]);

    console.log(`Successfully inserted records into ${insertTable}.`);
  } catch (err) {
    console.error("Error:", err.message);
  } finally {
    // Close the database connection
    connection.end();
  }
}

main()
  .then(() => {
    console.log("All insert operations completed.");
  })
  .catch((err) => {
    console.error("Error:", err.message);
  });

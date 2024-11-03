import http from 'http';
import PG from 'pg';

const port = Number(process.env.PORT);
const user = process.env.DB_USER;
const pass = process.env.DB_PASSWORD;
const host = process.env.DB_HOST;
const db_port = process.env.DB_PORT;
const db_name = process.env.DB_NAME;

const client = new PG.Client(`postgres://${user}:${pass}@${host}:${db_port}/${db_name}`);

let successfulConnection = false;

http.createServer(async (req, res) => {
  console.log(`Request: ${req.url}`);

  if (req.url === "/api") {
    try {
      await client.connect();
      successfulConnection = true;
    } catch (err) {
      console.error('Database not connected -', err.stack);
    }

    res.setHeader("Content-Type", "application/json");
    res.writeHead(200);

    let result;

    try {
      result = (await client.query("SELECT * FROM users")).rows[0];
    } catch (error) {
      console.error(error);
    }

    const data = {
      database: successfulConnection,
      userAdmin: result?.role === "admin"
    };

    res.end(JSON.stringify(data));
  } else {
    res.writeHead(503);
    res.end("Internal Server Error");
  }

}).listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});

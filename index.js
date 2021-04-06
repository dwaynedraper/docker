const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');

const pool = new Pool({
  user: 'deandraper',
  password: 'spacework1821',
  host: 'postgres',
  database: 'spacework',
  port: '5432'
});
const port = process.env.PORT || 3000;
const app = express();

app.use(express.json());
app.use(cors());

app.get('/', (req, res) => {
  res.send('Everything is connected!');
});

app.post('/insert', async (req, res) => {
  try {
    let query = "INSERT INTO users(firstName, lastName) VALUES ($1, $2) RETURNING *";
    let array = ['Tom', 'Jones'];
    let results = await pool.query(query, array);
    res.json(results.rows);
  } catch(err) {
    console.error(err.message);
    res.send(404);
  }
})

app.listen(port, () => {
  console.log('Docker app listening at port ' + port);
});
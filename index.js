const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Everything is connected!');
});

app.listen(port, () => {
  console.log('Docker app listening at port ' + port);
});
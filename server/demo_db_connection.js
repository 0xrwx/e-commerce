// get the client
const mysql = require('mysql2');

// create the connection to database
const connection = mysql.createConnection({
  host: '192.168.0.106',
  user: 'denys',
  password : 'password',
  database: 'ecommerce'
});

// test connection
connection.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

// simple query
connection.query(
  'SELECT * FROM `site_user`',
  function(err, results) {
    console.log(results);
  }
);
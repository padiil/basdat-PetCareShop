const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
const port = 3000;

// Koneksi ke MySQL
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root', // Ganti dengan username MySQL Anda
  password: '0153', // Ganti dengan password MySQL Anda
  database: 'petshop' // Ganti dengan nama database Anda
});

connection.connect(err => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});

// Middleware
app.use(bodyParser.json());
app.use(cors());

// Endpoint untuk mendapatkan data pelanggan
app.get('/api/pelanggan', (req, res) => {
  connection.query('SELECT * FROM pelanggan', (error, results) => {
    if (error) {
      console.error('Error querying database:', error);
      res.status(500).send('Error querying database');
      return;
    }
    res.json(results);
  });
});

//
app.get('/api/aksesoris', (req, res) => {
  connection.query('SELECT * FROM aksesoris', (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

app.get('/api/makanan', (req, res) => {
  connection.query('SELECT * FROM makanan', (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

app.get('/api/obat', (req, res) => {
  connection.query('SELECT * FROM obat', (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});


// Endpoint untuk pendaftaran
app.post('/api/register', (req, res) => {
  const { nama, alamat, no_telepon, email, password } = req.body;

  // Periksa apakah email atau no_telepon sudah ada
  const checkQuery = 'SELECT * FROM pelanggan WHERE email = ? OR no_telepon_pelanggan = ?';
  connection.query(checkQuery, [email, no_telepon], (checkError, checkResults) => {
    if (checkError) {
      console.error('Error checking database:', checkError);
      res.status(500).send('Error checking database');
      return;
    }
    if (checkResults.length > 0) {
      res.status(400).send('Email atau nomor telepon sudah digunakan');
      return;
    }

    // Masukkan data baru ke dalam database
    const insertQuery = 'INSERT INTO pelanggan (nama_pelanggan, alamat_pelanggan, no_telepon_pelanggan, email, password) VALUES (?, ?, ?, ?, ?)';
    connection.query(insertQuery, [nama, alamat, no_telepon, email, password], (insertError, insertResults) => {
      if (insertError) {
        console.error('Error inserting into database:', insertError);
        res.status(500).send('Error inserting into database');
        return;
      }
      res.status(201).send('User registered successfully');
    });
  });
});

// Endpoint untuk login
app.post('/api/login', (req, res) => {
  const { email, password } = req.body;

  const loginQuery = 'SELECT * FROM pelanggan WHERE email = ? AND password = ?';
  connection.query(loginQuery, [email, password], (loginError, loginResults) => {
    if (loginError) {
      console.error('Error querying database:', loginError);
      res.status(500).send('Error querying database');
      return;
    }
    if (loginResults.length > 0) {
      res.status(200).send('Login berhasil');
    } else {
      res.status(401).send('Email atau Password salah');
    }
  });
});

// Jalankan server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

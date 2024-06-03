const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
const port = 3000;

// Koneksi ke MySQL
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root', 
  password: '0153', 
  database: 'petshop' 
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

// Middleware untuk logging request
app.use((req, res, next) => {
  console.log(`Request URL: ${req.url}, Method: ${req.method}`);
  next();
});

// Endpoint untuk mendapatkan semua produk
app.get('/api/products', (req, res) => {
  const sql = `
    SELECT id_makanan AS id, 'makanan' AS category, nama_makanan AS name, harga_makanan AS price, gambar_makanan AS image FROM makanan
    UNION ALL
    SELECT id_aksesoris AS id, 'aksesoris' AS category, nama_aksesoris AS name, harga_aksesoris AS price, gambar_aksesoris AS image FROM aksesoris
    UNION ALL
    SELECT id_obat AS id, 'obat' AS category, nama_obat AS name, harga_obat AS price, gambar_obat AS image FROM obat
  `;
  connection.query(sql, (err, results) => {
    if (err) {
      console.error('Error querying database:', err);
      res.status(500).send('Error querying database');
      return;
    }
    res.json(results);
  });
});

// Endpoint untuk menambahkan produk
app.post('/api/products', (req, res) => {
  const { category, name, price, image } = req.body;
  let sql;
  if (category === 'makanan') {
    sql = 'INSERT INTO makanan (nama_makanan, harga_makanan, gambar_makanan) VALUES (?, ?, ?)';
  } else if (category === 'aksesoris') {
    sql = 'INSERT INTO aksesoris (nama_aksesoris, harga_aksesoris, gambar_aksesoris) VALUES (?, ?, ?)';
  } else if (category === 'obat') {
    sql = 'INSERT INTO obat (nama_obat, harga_obat, gambar_obat) VALUES (?, ?, ?)';
  }
  connection.query(sql, [name, price, image], (err, result) => {
    if (err) {
      console.error('Error inserting into database:', err);
      res.status(500).send('Error inserting into database');
      return;
    }
    res.status(201).send('Product added successfully');
  });
});

// Endpoint untuk menghapus produk
app.delete('/api/products/:id', (req, res) => {
  const { id } = req.params;
  const { category } = req.body;
  let sql;
  if (category === 'makanan') {
    sql = 'DELETE FROM makanan WHERE id_makanan = ?';
  } else if (category === 'aksesoris') {
    sql = 'DELETE FROM aksesoris WHERE id_aksesoris = ?';
  } else if (category === 'obat') {
    sql = 'DELETE FROM obat WHERE id_obat = ?';
  }
  connection.query(sql, [id], (err, result) => {
    if (err) {
      console.error('Error deleting from database:', err);
      res.status(500).send('Error deleting from database');
      return;
    }
    res.status(200).send('Product deleted successfully');
  });
});

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

// Endpoint untuk login pengguna
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

// Endpoint untuk login admin
app.post('/api/admin/login', (req, res) => {
  const { username, password } = req.body;

  const loginQuery = 'SELECT * FROM admin WHERE username = ? AND password = ?';
  connection.query(loginQuery, [username, password], (loginError, loginResults) => {
    if (loginError) {
      console.error('Error querying database:', loginError);
      res.status(500).send('Error querying database');
      return;
    }
    if (loginResults.length > 0) {
      res.status(200).json({ message: 'Login berhasil', admin: true });
    } else {
      res.status(401).send('Username atau Password salah');
    }
  });
});

// Jalankan server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

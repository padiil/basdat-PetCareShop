# PetCare Shop

---

## Deskripsi Proyek
Proyek ini adalah tentang perancangan dan pengembangan aplikasi PetCare Shop dengan memanfaatkan database MySQL. Aplikasi ini dikembangkan menggunakan Vue.js, Node.js, Express.js, dan beberapa teknologi lainnya. Database untuk proyek ini dapat ditemukan di folder `database` dan bisa diimpor langsung.

---

## Kontributor
- Azka Hasyyati Bayan
- Try Apriyana Nugraha
- Aar Lazuardi Majid
- Kevin Ibrahimovic
- Fadhil Gani

---

## Persiapan Proyek
### Instalasi
Untuk menginstal dependensi proyek, jalankan perintah berikut:
```bash
npm install
```

### Menjalankan Pengembangan
Untuk meng-compile dan melakukan hot-reload saat pengembangan, jalankan:
```bash
npm run serve
```

### Build untuk Produksi
Untuk meng-compile dan meminifikasi kode untuk produksi, jalankan:
```bash
npm run build
```

### Lint dan Perbaikan Kode
Untuk melakukan lint dan memperbaiki file, jalankan:
```bash
npm run lint
```

### Mengimpor Database
Database untuk aplikasi ini berada di folder database. Untuk mengimpor database, gunakan tool seperti phpMyAdmin atau MySQL command line:
```bash
mysql -u [username] -p [database_name] < path/to/database/petshop.sql
```

### Kustomisasi Konfigurasi
Untuk informasi lebih lanjut mengenai konfigurasi, lihat [Configuration Reference.](https://cli.vuejs.org/config/)

---

## Struktur Proyek
- `backend/` - Berisi kode backend aplikasi
- `database/` - Berisi file SQL untuk database
- `public/` - Berisi aset publik
- `src/` - Berisi kode sumber frontend aplikasi

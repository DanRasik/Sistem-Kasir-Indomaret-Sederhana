<p align="center"> <img src="https://lh3.googleusercontent.com/d/1-TrhdCX8Geg0MPz6wW44Gst2bRhawRC3" width="300" alt="TRPL Logo"> </p>

<h1 align="center">🛒 Sistem Transaksi Penjualan Indomaret</h1>

<p align="center"> <b>Database Management System untuk Pengelolaan Minimarket</b>


Proyek Akhir Mata Kuliah <i>Sistem Basis Data</i>  </p>

### 📌 Deskripsi Proyek

Sistem Transaksi Penjualan Indomaret adalah implementasi basis data relasional yang dirancang untuk menangani operasional kasir secara efisien. Database ini mengelola data inventaris barang, data member, informasi kasir, serta mencatat transaksi penjualan secara detail dengan sistem pengurangan stok otomatis.


Proyek ini menerapkan berbagai konsep basis data, mulai dari normalisasi (1NF hingga 3NF), perancangan ERD, hingga penggunaan query SQL tingkat lanjut.


### 👥 Profil Kelompok
Dokumentasi dan pengembangan database ini disusun oleh kelompok TRPL25A1:


Ahmad Yardan Rasika 🆔 NIM: 250119003 


Naufal Akbar Rabbani 🆔 NIM: 250119019 


Program Studi Teknologi Rekayasa Perangkat Lunak Universitas Duta Bangsa Surakarta 


### 🛠️ Struktur Database
Database kasir_indomaret terdiri dari 6 tabel utama yang saling berelasi:

🔹 Master Data

barang: Menyimpan informasi stok dan harga produk.



kasir: Data petugas yang melayani transaksi.



MemberIndomaret: Informasi pelanggan terdaftar dan poin loyalitas.



MetodePembayaran: Berbagai pilihan pembayaran (Tunai, E-wallet, dll).


🔹 Transaksi

transaksi: Header transaksi yang mencatat waktu, total belanja, dan kembalian.


DetailTransaksi: Rincian item yang dibeli dalam satu transaksi beserta penggunaan voucher.

### 🚀 Fitur Query Utama
Implementasi SQL mencakup berbagai fungsionalitas untuk pelaporan dan analisis data:

###📦 Manajemen Inventaris & Penjualan

Analisis Stok: Menggunakan ORDER BY dan LIMIT untuk memantau produk.


Pencarian Barang: Memanfaatkan operator LIKE untuk pencarian produk spesifik (misal: "mineral").


Fungsi Agregasi: Menghitung rata-rata harga, total aset stok, serta harga termurah/termahal.

### 💰 Keamanan & Integritas Transaksi

Transaction Control (TCL): Penggunaan COMMIT dan ROLLBACK untuk memastikan data transaksi tersimpan dengan aman atau dibatalkan jika terjadi kesalahan.



Kalkulasi Otomatis: Perhitungan diskon dan total bayar menggunakan operasi aritmatika dan alias.

### 🔍 Relasi & Analisis Data

Laporan Transaksi: Menggunakan INNER JOIN multi-tabel untuk menghubungkan data Kasir, Member, dan Transaksi dalam satu tampilan.


Audit Member: Memanfaatkan LEFT JOIN dan RIGHT JOIN untuk memetakan keterkaitan member dengan aktivitas belanja.

### 📝 Cara Menjalankan
Pastikan MySQL Server atau XAMPP (Apache & MySQL) dalam keadaan aktif.

Clone repositori ini atau salin skrip SQL yang tersedia.

Eksekusi perintah CREATE DATABASE kasir_indomaret;.

Jalankan perintah USE kasir_indomaret;.

Impor struktur tabel dan data dari file .sql yang telah disediakan di folder repositori.

###📄 Lisensi & Referensi
Proyek ini disusun untuk tujuan akademik di Universitas Duta Bangsa Surakarta.

Referensi utama: Oracle MySQL 8.0 Reference Manual & Jurnal Kuliah Pemrograman Basis Data

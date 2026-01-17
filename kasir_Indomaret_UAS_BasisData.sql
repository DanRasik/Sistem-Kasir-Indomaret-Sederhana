CREATE DATABASE IF NOT EXISTS kasir_indomaret;

USE kasir_indomaret;

CREATE TABLE barang (
	IdBarang VARCHAR(10) PRIMARY KEY,
    NamaBarang VARCHAR(50),
    HargaBarang INT,
    stok INT
);

CREATE TABLE kasir (
	IdKasir VARCHAR(10) PRIMARY KEY,
    NamaKasir VARCHAR(20) NOT NULL,
    NoHpKasir VARCHAR(15),
    StatusKasir VARCHAR(10)
);

CREATE TABLE MemberIndomaret (
	IdMember VARCHAR(10) PRIMARY KEY,
    NamaMember VARCHAR(20) NOT NULL,
    NoHpMember VARCHAR(15),
    Poin INT
);

CREATE TABLE MetodePembayaran (
	IdMetodePembayaran VARCHAR(10) PRIMARY KEY,
    NamaMetodePembayaran VARCHAR(20) NOT NULL,
    JenisMetodePembayaran VARCHAR(20) NOT NULL,
    JumlahBayar INT,
    StatusPembayaran VARCHAR(20)
);

CREATE TABLE transaksi (
	IdTransaksi VARCHAR(10) PRIMARY KEY,
    TanggalTransaksi DATE,
    JamTransaksi TIME,
    IdMember VARCHAR(10),
    IdKasir VARCHAR(10),
    TotalBelanja INT,
    IdMetodePembayaran VARCHAR(10),
    JumlahBayar INT,
    kembali INT,
    FOREIGN KEY (IdMember) REFERENCES MemberIndomaret (IdMember),
    FOREIGN KEY (IdKasir) REFERENCES kasir (IdKasir),
    FOREIGN KEY (IdMetodePembayaran) REFERENCES MetodePembayaran (IdMetodePembayaran)
);

CREATE TABLE DetailTransaksi (
	IdTransaksi VARCHAR(10),
    IdBarang VARCHAR(10),
    JumlahBarang INT,
    subtotal INT,
    voucher VARCHAR(20),
    FOREIGN KEY (IdTransaksi) REFERENCES transaksi (IdTransaksi),
    FOREIGN KEY (IdBarang) REFERENCES barang (IdBarang)
);

INSERT INTO barang(IdBarang, NamaBarang, HargaBarang, stok) VALUES
('BR001','aqua air mineral 600ml','3800','100'),
('BR002','hexos mint 8s','4000','60'),
('BR003','pie susu pcs','3500','30');

INSERT INTO kasir(IdKasir, NamaKasir, NoHpKasir, StatusKasir) VALUES
('KS001','yahya','08111500280','aktif');

INSERT INTO MemberIndomaret(IdMember, NamaMember, NoHpMember, poin) VALUES
('MI001','bayu saputra','081234560013','100');

-- UPDATE
UPDATE barang SET stok = 5 
WHERE IdBarang = 'BR003';

-- MENAMBAHKAN DAN MENGHAPUS TRANSAKSI
START TRANSACTION; 

	-- MEMASUKKAN TRANSAKSI
	INSERT INTO MetodePembayaran VALUES
    ('MP001','tunai','tunai','9500','berhasil');
    
	INSERT INTO transaksi(Idtransaksi, TanggalTransaksi, JamTransaksi, IdMember, IdKasir, TotalBelanja, IdMetodePembayaran, JumlahBayar, Kembali)VALUES
    ('TFEQ-97372',NOW(),NOW(),'MI001','KS001','9400','MP001','9500','100');
    
    INSERT INTO DetailTransaksi(IdTransaksi, IdBarang, JumlahBarang, Subtotal, voucher) VALUES
    ('TFEQ-97372','BR001','1','3000','800'),
    ('TFEQ-97372','BR002','1','2900','1100'),
    ('TFEQ-97372','BR003','1','3500','0');
    
    -- MENGURANGI StoK
    UPDATE barang SET stok = stok - 1 WHERE IdBarang = 'BR001';
    UPDATE barang SET stok = stok - 1 WHERE IdBarang = 'BR002';
    UPDATE barang SET stok = stok - 1 WHERE IdBarang = 'BR003';
    
-- JIKA INGIN MEMBATALKAN
ROLLBACK;
-- JIKA INGIN MENYIMPAN PERMANEN
COMMIT;

-- 1. ORDER BY
SELECT * FROM barang
ORDER BY HargaBarang DESC;

-- 2. DISTINCT 
SELECT DISTINCT IdBarang
FROM barang;

-- 3. OPERATOR LOGIKA
SELECT * FROM barang
WHERE HargaBarang >= '3000' AND stok > '80';

-- 4. LIKE
SELECT * FROM barang
WHERE NamaBarang LIKE '%mineral%';

-- 5. BETWEEN
SELECT * FROM barang
WHERE HargaBarang BETWEEN 3800 AND 4000;

-- 6. CALCULATION dan ALIAS
SELECT Idtransaksi, TotalBelanja AS total,
0.1 * TotalBelanja AS diskon, 
TotalBelanja - 0.1 * TotalBelanja AS HargaDiskon
FROM transaksi;

-- 7. FUNGSI AGREGAT
SELECT MIN(HargaBarang) AS Barang_Termurah,
MAX(HargaBarang) AS Barang_Termahal,
AVG(HargaBarang) AS RataRata_Harga,
SUM(HargaBarang) AS Total_harga,
COUNT(HargaBarang) AS banyak_stok
FROM barang;

-- 8. GROUP BY
SELECT IdBarang, NamaBarang, COUNT(*) AS BanyakData
FROM barang
GROUP BY IdBarang, NamaBarang;

-- 9. HAVING
SELECT IdBarang, COUNT(*) AS jumlah
FROM barang
WHERE Idbarang <>'BR001'
GROUP BY IdBarang
having COUNT(*)=1
ORDER BY jumlah;

-- JOIN
-- 1. NATURAL JOIN
SELECT IdTransaksi, NamaBarang, JumlahBarang, subtotal
FROM DetailTransaksi NATURAL JOIN barang; 

-- 2. JOIN dengan USING
SELECT IdTransaksi, IdBarang, JumlahBarang, subtotal
FROM transaksi JOIN DetailTransaksi USING(IdTransaksi);

-- 3. INNER JOIN
SELECT transaksi.IdTransaksi, NamaMember, TanggalTransaksi, NamaKasir
FROM kasir INNER JOIN transaksi
ON kasir.IdKasir = transaksi.IdKasir
INNER JOIN MemberIndomaret
ON transaksi.IdMember = MemberIndomaret.IdMember;

-- 4. EQUI JOIN
SELECT NamaMember, IdTransaksi, TotalBelanja
FROM MemberIndomaret, transaksi
WHERE MemberIndomaret.IdMember = transaksi.IdMember;

-- 5. LEFT JOIN
SELECT NamaBarang, IdTransaksi, subtotal
FROM barang LEFT JOIN DetailTransaksi
ON barang.IdBarang = DetailTransaksi.IdBarang;

-- 6. RIGHT JOIN
SELECT NamaBarang, IdTransaksi, subtotal
FROM barang RIGHT JOIN DetailTransaksi
ON barang.IdBarang = DetailTransaksi.IdBarang;

-- 7. FULL JOIN
SELECT A.NamaBarang, B.IdTransaksi, B.JumlahBarang
FROM barang A
LEFT JOIN DetailTransaksi B ON A.IdBarang = B.IdBarang
UNION
SELECT A.NamaBarang, B.IdTransaksi, B.JumlahBarang
FROM barang A
RIGHT JOIN DetailTransaksi B ON A.IdBarang = B.IdBarang;
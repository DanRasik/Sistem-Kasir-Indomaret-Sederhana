create database sistem_kasirIndomaret;

USE sistem_kasirIndomaret;

CREATE TABLE barang (
	IdBarang VARCHAR(10),
    NamaBarang VARCHAR(20),
    HargaBarang INT,
    stok INT,
    PRIMARY KEY (IdBarang)
);

CREATE TABLE kasir (
	IdKasir VARCHAR(10),
    NamaKasir VARCHAR(20),
    NoHpKasir VARCHAR(15),
    StatusKasir VARCHAR(20),
    PRIMARY KEY (IdKasir)
);

CREATE TABLE MemberIndomaret (
	IdMember VARCHAR(10),
    NamaMember VARCHAR(20),
    NoHpMember VARCHAR(15),
    Poin INT,
    PRIMARY KEY (IdMember)
);

CREATE TABLE MetodePembayaran (
	IdMetodePembayaran VARCHAR(10),
    NamaMetodePembayaran VARCHAR(20),
    JenisMetodePembayaran VARCHAR(20),
    JumlahBayar INT,
    StatusPembayaran VARCHAR(20),
    PRIMARY KEY (IdMetodePembayaran)
);

CREATE TABLE transaksi (
	IdTransaksi VARCHAR(10),
    TanggalTransaksi DATE,
    JamTransaksi TIME,
    IdMember VARCHAR(10),
    IdKasir VARCHAR(10),
    TotalBelanja INT,
    IdMetodePembayaran VARCHAR(10),
    JumlahBayar INT,
    kembali INT,
    PRIMARY KEY (IdTransaksi),
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
('SL001', 'Pulpen Standard', 3000, 100),
('SL002', 'Pensil 2B', 2500, 120),
('SL003', 'Buku Tulis 38 Lembar', 5000, 80),
('SL004', 'Penghapus', 2000, 150),
('SL005', 'Penggaris 30cm', 4000, 90),
('SL006', 'Spidol Hitam', 8000, 60),
('SL007', 'Spidol Warna', 9000, 50),
('SL008', 'Tip-Ex', 7000, 40),
('SL009', 'Stabilo Kuning', 8500, 55),
('SL010', 'Map Plastik', 3000, 200),
('SL011', 'Map Kertas', 2500, 180),
('SL012', 'Amplop Coklat', 1500, 300),
('SL013', 'Kertas HVS A4', 55000, 25),
('SL014', 'Kertas HVS F4', 60000, 20),
('SL015', 'Buku Gambar', 6500, 70),
('SL016', 'Crayon 12 Warna', 25000, 30),
('SL017', 'Pensil Warna', 30000, 25),
('SL018', 'Bolpoin Gel', 6000, 110),
('SL019', 'Rautan Pensil', 2500, 140),
('SL020', 'Sticky Notes', 5000, 95),
('SL021', 'Binder A5', 20000, 35),
('SL022', 'Binder A4', 30000, 28),
('SL023', 'Notebook Spiral', 15000, 45),
('SL024', 'Lakban Bening', 12000, 50),
('SL025', 'Lakban Hitam', 13000, 40),
('SL026', 'Gunting Kecil', 10000, 65),
('SL027', 'Gunting Besar', 15000, 30),
('SL028', 'Kalkulator', 75000, 15),
('SL029', 'Flashdisk 16GB', 65000, 20),
('SL030', 'Flashdisk 32GB', 90000, 12);

INSERT INTO kasir(IdKasir, NamaKasir, NoHpKasir, StatusKasir) VALUES
('KS001', 'Andi Saputra', '081234567801', 'Aktif'),
('KS002', 'Budi Santoso', '081234567802', 'Aktif'),
('KS003', 'Citra Lestari', '081234567803', 'Aktif'),
('KS004', 'Dewi Anggraini', '081234567804', 'Nonaktif'),
('KS005', 'Eko Prasetyo', '081234567805', 'Aktif'),
('KS006', 'Fajar Maulana', '081234567806', 'Aktif'),
('KS007', 'Gina Permata', '081234567807', 'Aktif'),
('KS008', 'Hendra Wijaya', '081234567808', 'Nonaktif'),
('KS009', 'Intan Sari', '081234567809', 'Aktif'),
('KS010', 'Joko Susilo', '081234567810', 'Aktif');

INSERT INTO MemberIndomaret(IdMember, NamaMember, NoHpMember, poin) VALUES
('MI001', 'Ahmad Fadli', '081234560001', 120),
('MI002', 'Siti Aisyah', '081234560002', 85),
('MI003', 'Budi Hartono', '081234560003', 200),
('MI004', 'Dewi Lestari', '081234560004', 60),
('MI005', 'Rizky Pratama', '081234560005', 150),
('MI006', 'Nur Aini', '081234560006', 95),
('MI007', 'Andi Saputra', '081234560007', 180),
('MI008', 'Putri Amelia', '081234560008', 70),
('MI009', 'Fajar Nugroho', '081234560009', 220),
('MI010', 'Intan Permata', '081234560010', 130),
('MI011', 'Hendra Wijaya', '081234560011', 40),
('MI012', 'Rina Oktaviani', '081234560012', 90),
('MI013', 'Agus Setiawan', '081234560013', 160),
('MI014', 'Lina Marlina', '081234560014', 110),
('MI015', 'Bayu Saputra', '081234560015', 75),
('MI016', 'Nisa Khairunnisa', '081234560016', 140),
('MI017', 'Yoga Pradana', '081234560017', 55),
('MI018', 'Sari Wulandari', '081234560018', 170),
('MI019', 'Dimas Arya', '081234560019', 100),
('MI020', 'Tika Puspita', '081234560020', 210);

INSERT INTO MetodePembayaran(IdMetodePembayaran, NamaMetodePembayaran, JenisMetodePembayaran, JumlahBayar, StatusPembayaran) VALUES
('MP001', 'Tunai', 'Cash', 15000, 'Berhasil'),
('MP002', 'Tunai', 'Cash', 25000, 'Berhasil'),
('MP003', 'Tunai', 'Cash', 50000, 'Berhasil'),
('MP004', 'Tunai', 'Cash', 75000, 'Berhasil'),
('MP005', 'Tunai', 'Cash', 100000, 'Berhasil'),
('MP006', 'OVO', 'E-Wallet', 20000, 'Berhasil'),
('MP007', 'OVO', 'E-Wallet', 35000, 'Berhasil'),
('MP008', 'OVO', 'E-Wallet', 50000, 'Gagal'),
('MP009', 'OVO', 'E-Wallet', 65000, 'Berhasil'),
('MP010', 'OVO', 'E-Wallet', 80000, 'Berhasil'),
('MP011', 'GoPay', 'E-Wallet', 15000, 'Berhasil'),
('MP012', 'GoPay', 'E-Wallet', 30000, 'Berhasil'),
('MP013', 'GoPay', 'E-Wallet', 45000, 'Gagal'),
('MP014', 'GoPay', 'E-Wallet', 60000, 'Berhasil'),
('MP015', 'GoPay', 'E-Wallet', 90000, 'Berhasil'),
('MP016', 'Dana', 'E-Wallet', 20000, 'Berhasil'),
('MP017', 'Dana', 'E-Wallet', 40000, 'Berhasil'),
('MP018', 'Dana', 'E-Wallet', 55000, 'Berhasil'),
('MP019', 'Dana', 'E-Wallet', 70000, 'Gagal'),
('MP020', 'Dana', 'E-Wallet', 85000, 'Berhasil'),
('MP021', 'BRI', 'Transfer Bank', 100000, 'Berhasil'),
('MP022', 'BRI', 'Transfer Bank', 150000, 'Berhasil'),
('MP023', 'BRI', 'Transfer Bank', 200000, 'Berhasil'),
('MP024', 'BRI', 'Transfer Bank', 250000, 'Gagal'),
('MP025', 'BRI', 'Transfer Bank', 300000, 'Berhasil'),
('MP026', 'BCA', 'Transfer Bank', 120000, 'Berhasil'),
('MP027', 'BCA', 'Transfer Bank', 180000, 'Berhasil'),
('MP028', 'BCA', 'Transfer Bank', 220000, 'Gagal'),
('MP029', 'BCA', 'Transfer Bank', 260000, 'Berhasil'),
('MP030', 'BCA', 'Transfer Bank', 320000, 'Berhasil'),
('MP031', 'Mandiri', 'Transfer Bank', 110000, 'Berhasil'),
('MP032', 'Mandiri', 'Transfer Bank', 170000, 'Berhasil'),
('MP033', 'Mandiri', 'Transfer Bank', 230000, 'Berhasil'),
('MP034', 'Mandiri', 'Transfer Bank', 290000, 'Gagal'),
('MP035', 'Mandiri', 'Transfer Bank', 350000, 'Berhasil'),
('MP036', 'QRIS', 'QR Code', 25000, 'Berhasil'),
('MP037', 'QRIS', 'QR Code', 50000, 'Berhasil'),
('MP038', 'QRIS', 'QR Code', 75000, 'Berhasil'),
('MP039', 'QRIS', 'QR Code', 100000, 'Berhasil'),
('MP040', 'QRIS', 'QR Code', 125000, 'Gagal');

INSERT INTO transaksi(Idtransaksi, TanggalTransaksi, JamTransaksi, IdMember, IdKasir, TotalBelanja, IdMetodePembayaran, JumlahBayar, Kembali) VALUES
('TR001','2026-01-01','08:05:00','MI014','KS007',18000,'MP023',20000,2000),
('TR002','2026-01-01','08:18:00','MI003','KS002',34000,'MP011',35000,1000),
('TR003','2026-01-01','08:35:00','MI019','KS009',47000,'MP035',50000,3000),
('TR004','2026-01-01','08:55:00','MI007','KS004',72000,'MP004',75000,3000),
('TR005','2026-01-01','09:10:00','MI012','KS010',98000,'MP028',100000,2000),
('TR006','2026-01-02','09:25:00','MI001','KS006',15000,'MP036',25000,10000),
('TR007','2026-01-02','09:40:00','MI016','KS001',33000,'MP007',35000,2000),
('TR008','2026-01-02','10:00:00','MI005','KS008',48000,'MP018',55000,7000),
('TR009','2026-01-02','10:15:00','MI020','KS003',63000,'MP014',65000,2000),
('TR010','2026-01-02','10:30:00','MI009','KS005',78000,'MP030',80000,2000),
('TR011','2026-01-03','10:45:00','MI011','KS002',14000,'MP001',15000,1000),
('TR012','2026-01-03','11:00:00','MI006','KS009',29000,'MP012',30000,1000),
('TR013','2026-01-03','11:15:00','MI018','KS004',43000,'MP033',45000,2000),
('TR014','2026-01-03','11:30:00','MI002','KS007',59000,'MP020',60000,1000),
('TR015','2026-01-03','11:45:00','MI015','KS001',88000,'MP015',90000,2000),
('TR016','2026-01-04','12:00:00','MI010','KS010',19000,'MP016',20000,1000),
('TR017','2026-01-04','12:15:00','MI004','KS006',39000,'MP037',50000,11000),
('TR018','2026-01-04','12:30:00','MI017','KS008',53000,'MP009',65000,12000),
('TR019','2026-01-04','12:45:00','MI008','KS003',68000,'MP019',70000,2000),
('TR020','2026-01-04','13:00:00','MI013','KS005',82000,'MP040',125000,43000),
('TR021','2026-01-05','13:15:00','MI020','KS002',98000,'MP022',150000,52000),
('TR022','2026-01-05','13:30:00','MI001','KS009',148000,'MP031',170000,22000),
('TR023','2026-01-05','13:45:00','MI006','KS004',198000,'MP025',300000,102000),
('TR024','2026-01-05','14:00:00','MI014','KS007',248000,'MP024',250000,2000),
('TR025','2026-01-05','14:15:00','MI003','KS010',298000,'MP034',300000,2000),
('TR026','2026-01-06','14:30:00','MI018','KS001',118000,'MP026',120000,2000),
('TR027','2026-01-06','14:45:00','MI007','KS006',178000,'MP032',180000,2000),
('TR028','2026-01-06','15:00:00','MI012','KS008',218000,'MP029',260000,42000),
('TR029','2026-01-06','15:15:00','MI009','KS003',258000,'MP021',260000,2000),
('TR030','2026-01-06','15:30:00','MI016','KS005',318000,'MP027',320000,2000),
('TR031','2026-01-07','15:45:00','MI005','KS002',108000,'MP006',120000,12000),
('TR032','2026-01-07','16:00:00','MI019','KS009',168000,'MP017',170000,2000),
('TR033','2026-01-07','16:15:00','MI002','KS004',228000,'MP010',230000,2000),
('TR034','2026-01-07','16:30:00','MI011','KS007',288000,'MP038',300000,12000),
('TR035','2026-01-07','16:45:00','MI015','KS001',348000,'MP039',350000,2000),
('TR036','2026-01-08','17:00:00','MI010','KS010',24000,'MP002',25000,1000),
('TR037','2026-01-08','17:15:00','MI017','KS006',49000,'MP013',50000,1000),
('TR038','2026-01-08','17:30:00','MI004','KS008',74000,'MP008',75000,1000),
('TR039','2026-01-08','17:45:00','MI013','KS003',98000,'MP005',100000,2000),
('TR040','2026-01-08','18:00:00','MI008','KS005',123000,'MP003',125000,2000);

INSERT INTO DetailTransaksi(IdTransaksi, IdBarang, JumlahBarang, Subtotal, voucher) VALUES
-- TR001
('TR001','SL005',2,8000,'PROMO5'),('TR001','SL012',1,1500,'HEMAT5'),('TR001','SL020',1,5000,NULL),

-- TR002
('TR002','SL003',2,10000,'PROMO10'),('TR002','SL018',1,6000,NULL),('TR002','SL009',1,8500,'PROMO5'),

-- TR003
('TR003','SL001',3,9000,'HEMAT5'),('TR003','SL010',2,6000,NULL),('TR003','SL021',1,20000,'HEMAT10'),

-- TR004
('TR004','SL006',2,16000,'PROMO10'),('TR004','SL004',3,6000,NULL),('TR004','SL015',1,6500,'PROMO5'),

-- TR005
('TR005','SL013',1,55000,'HEMAT10'),('TR005','SL002',4,10000,NULL),('TR005','SL019',2,5000,'PROMO5'),

-- TR006
('TR006','SL001',2,6000,'PROMO5'),('TR006','SL004',2,4000,NULL),('TR006','SL020',1,5000,'HEMAT5'),

-- TR007
('TR007','SL008',1,7000,'PROMO5'),('TR007','SL018',2,12000,'PROMO10'),('TR007','SL011',3,7500,NULL),

-- TR008
('TR008','SL017',1,30000,'HEMAT10'),('TR008','SL019',2,5000,NULL),('TR008','SL004',3,6000,'PROMO5'),

-- TR009
('TR009','SL014',1,60000,'HEMAT10'),('TR009','SL002',2,5000,NULL),('TR009','SL012',2,3000,'PROMO5'),

-- TR010
('TR010','SL028',1,75000,'PROMO10'),('TR010','SL001',1,3000,NULL),('TR010','SL020',1,5000,'PROMO5'),

-- TR011
('TR011','SL003',2,10000,'PROMO5'),('TR011','SL010',1,3000,NULL),('TR011','SL019',1,2500,'HEMAT5'),

-- TR012
('TR012','SL006',1,8000,'PROMO5'),('TR012','SL009',2,17000,'PROMO10'),('TR012','SL004',2,4000,NULL),

-- TR013
('TR013','SL015',2,13000,'HEMAT5'),('TR013','SL002',3,7500,NULL),('TR013','SL012',1,1500,'PROMO5'),

-- TR014
('TR014','SL021',1,20000,'PROMO10'),('TR014','SL010',2,6000,NULL),('TR014','SL001',3,9000,'HEMAT5'),

-- TR015
('TR015','SL028',1,75000,'HEMAT10'),('TR015','SL019',2,5000,'PROMO5'),('TR015','SL004',4,8000,NULL),

-- TR016
('TR016','SL001',2,6000,'PROMO5'),('TR016','SL003',2,10000,NULL),('TR016','SL020',1,5000,'HEMAT5'),

-- TR017
('TR017','SL017',1,30000,'PROMO10'),('TR017','SL004',3,6000,NULL),('TR017','SL011',2,5000,'PROMO5'),

-- TR018
('TR018','SL013',1,55000,'HEMAT10'),('TR018','SL002',2,5000,NULL),('TR018','SL019',1,2500,'PROMO5'),

-- TR019
('TR019','SL006',2,16000,'PROMO10'),('TR019','SL004',3,6000,NULL),('TR019','SL020',1,5000,'HEMAT5'),

-- TR020
('TR020','SL028',1,75000,'PROMO10'),('TR020','SL010',2,6000,NULL),('TR020','SL001',1,3000,'PROMO5'),

-- TR021
('TR021','SL014',1,60000,'HEMAT10'),('TR021','SL002',4,10000,NULL),('TR021','SL012',2,3000,'PROMO5'),

-- TR022
('TR022','SL021',1,20000,'PROMO10'),('TR022','SL019',2,5000,'PROMO5'),('TR022','SL004',3,6000,NULL),

-- TR023
('TR023','SL028',1,75000,'HEMAT10'),('TR023','SL013',1,55000,'PROMO10'),('TR023','SL020',1,5000,NULL),

-- TR024
('TR024','SL014',1,60000,'PROMO10'),('TR024','SL001',2,6000,'PROMO5'),('TR024','SL019',1,2500,NULL),

-- TR025
('TR025','SL028',1,75000,'HEMAT10'),('TR025','SL002',4,10000,NULL),('TR025','SL004',3,6000,'PROMO5'),

-- TR026
('TR026','SL015',2,13000,'HEMAT5'),('TR026','SL003',2,10000,NULL),('TR026','SL012',1,1500,'PROMO5'),

-- TR027
('TR027','SL017',1,30000,'PROMO10'),('TR027','SL001',3,9000,NULL),('TR027','SL020',1,5000,'HEMAT5'),

-- TR028
('TR028','SL013',1,55000,'HEMAT10'),('TR028','SL002',2,5000,NULL),('TR028','SL019',1,2500,'PROMO5'),

-- TR029
('TR029','SL028',1,75000,'PROMO10'),('TR029','SL004',4,8000,'PROMO5'),('TR029','SL010',2,6000,NULL),

-- TR030
('TR030','SL014',1,60000,'HEMAT10'),('TR030','SL003',3,15000,NULL),('TR030','SL019',2,5000,'PROMO5'),

-- TR031
('TR031','SL021',1,20000,'PROMO10'),('TR031','SL002',4,10000,NULL),('TR031','SL012',2,3000,'PROMO5'),

-- TR032
('TR032','SL028',1,75000,'HEMAT10'),('TR032','SL004',3,6000,'PROMO5'),('TR032','SL019',1,2500,NULL),

-- TR033
('TR033','SL017',1,30000,'PROMO10'),('TR033','SL003',2,10000,NULL),('TR033','SL020',1,5000,'PROMO5'),

-- TR034
('TR034','SL013',1,55000,'HEMAT10'),('TR034','SL001',3,9000,NULL),('TR034','SL019',1,2500,'PROMO5'),

-- TR035
('TR035','SL028',1,75000,'PROMO10'),('TR035','SL004',4,8000,'PROMO5'),('TR035','SL020',1,5000,NULL),

-- TR036
('TR036','SL003',2,10000,'PROMO5'),('TR036','SL001',2,6000,NULL),('TR036','SL012',1,1500,'HEMAT5'),

-- TR037
('TR037','SL017',1,30000,'PROMO10'),('TR037','SL004',3,6000,NULL),('TR037','SL019',1,2500,'PROMO5'),

-- TR038
('TR038','SL014',1,60000,'HEMAT10'),('TR038','SL002',2,5000,NULL),('TR038','SL020',1,5000,'PROMO5'),

-- TR039
('TR039','SL028',1,75000,'PROMO10'),('TR039','SL001',3,9000,NULL),('TR039','SL019',1,2500,'PROMO5'),

-- TR040
('TR040','SL013',1,55000,'HEMAT10'),('TR040','SL004',4,8000,'PROMO5'),('TR040','SL020',1,5000,NULL);


-- order by
SELECT NamaKasir, StatusKasir
FROM kasir;

SELECT NamaBarang, HargaBarang, stok
FROM barang
ORDER BY HargaBarang DESC;

SELECT TanggalTransaksi, JamTransaksi
FROM transaksi
ORDER BY JamTransaksi, TanggalTransaksi;

SELECT TanggalTransaksi, JamTransaksi
FROM transaksi
ORDER BY TanggalTransaksi, JamTransaksi;

-- Distinc
SELECT * FROM transaksi;

SELECT DISTINCT IdTransaksi
FROM transaksi;

SELECT IdTransaksi, TotalBelanja
FROM transaksi;

-- operator logika

SELECT * FROM MetodePembayaran
WHERE JenisMetodePembayaran = 'E-Wallet' AND JumlahBayar > '20000';

SELECT * FROM MetodePembayaran
WHERE JenisMetodePembayaran = 'E-Wallet';

-- LIKE QUERY
SELECT * FROM barang
WHERE NamaBarang = 'Kertas';

SELECT * FROM barang
WHERE NamaBarang LIKE '%Kertas%';

-- BETWEEN and RANGE
SELECT * FROM barang
WHERE HargaBarang>=20000 AND HargaBarang<=90000
ORDER BY HargaBarang;

SELECT * FROM barang
WHERE HargaBarang BETWEEN 20000 AND 90000;

-- calculation dan alias

SELECT IdTransaksi, TotalBelanja, 0.1*TotalBelanja
FROM transaksi;

SELECT IdTransaksi, TotalBelanja AS total, 0.1*TotalBelanja AS diskon
FROM transaksi;

SELECT Idtransaksi, TotalBelanja AS total,
10/100 * TotalBelanja AS diskon, TotalBelanja - diskon
FROM transaksi;

SELECT Idtransaksi, TotalBelanja AS total,
10/100 * TotalBelanja AS diskon, 
TotalBelanja - 10/100 * TotalBelanja AS HargaDiskon
FROM transaksi;

SELECT Idtransaksi, TotalBelanja AS total,
10/100 * TotalBelanja AS diskon, 
Totalbelanja - 10/100 * TotalBelanja AS HargaDiskon
FROM transaksi
WHERE 10/100 * TotalBelanja > 20000
ORDER BY diskon DESC;

-- FUNGSI AGREGAT
SELECT MIN(TotalBelanja) AS BelanjaTerkecil
FROM barang;

SELECT MIN(TotalBelanja) AS BelanjaTerkecil,
MAX(TotalBelanja) AS BelanjaTerbanyak
FROM transaksi;

SELECT MIN(TotalBelanja) AS BelanjaTerkecil,
MAX(TotalBelanja) AS BelanjaTerbanyak,
AVG(TotalBelanja) AS RataRataBelanja,
SUM(TotalBelanja) AS TotalPendapatan,
COUNT(TotalBelanja) AS BanyakTransaksi
FROM transaksi;

SELECT IdTransaksi, COUNT(*) AS jumlah
FROM DetailTransaksi
WHERE idTransaksi = 'TR001';

-- GROUP BY
SELECT IdTransaksi, IdBarang, COUNT(*) AS BanyakData
FROM DetailTransaksi
GROUP BY IdTransaksi, IdBarang;

SELECT IdTransaksi, IdBarang, COUNT(*) AS BanyakData
FROM DetailTransaksi
GROUP BY IdTransaksi;

SELECT IdBarang, COUNT(*) AS JUMLAH
FROM DetailTransaksi
WHERE jumlah>2
GROUP BY IdBarang
GROUP BY jumlah;

SELECT IdBarang, COUNT(*) AS JUMLAH
FROM DetailTransaksi
WHERE COUNT(*)>2
GROUP BY IdBarang
GROUP BY jumlah;

SELECT IdBarang, COUNT(*) AS JUMLAH
FROM DetailTransaksi
WHERE COUNT(*)>2
GROUP BY jumlah;

SELECT IdBarang, COUNT(*) AS jumlah
FROM DetailTransaksi
WHERE Idbarang <>'SL001'
GROUP BY IdBarang
having COUNT(*)<5
ORDER BY jumlah;


SELECT IdBarang, COUNT(*) AS jumlah
FROM DetailTransaksi
GROUP BY IdBarang
having IdBarang ='SL001' AND IdTransaksi <> 'TR001'
ORDER BY jumlah;




-- NATURAL JOIN

SELECT IdTransaksi, NamaBarang, JumlahBarang, subtotal
FROM DetailTransaksi NATURAL JOIN barang; 

-- JOIN DENGAN USING

SELECT IdTransaksi, IdBarang, JumlahBarang, subtotal
FROM transaksi JOIN DetailTransaksi USING(IdTransaksi);

-- INNER JOIN

SELECT NamaBarang, JumlahBarang, subtotal
FROM barang INNER JOIN DetailTransaksi
ON barang.IdBarang = DetailTransaksi.IdBarang;

SELECT DetailTransaksi.IdTransaksi, NamaBarang, JumlahBarang
FROM DetailTransaksi INNER JOIN barang
ON DetailTransaksi.IdBarang = barang.IdBarang
INNER JOIN transaksi
ON DetailTransaksi.IdTransaksi = transaksi.IdTransaksi;

-- INNER JOIN

SELECT transaksi.IdTransaksi, NamaMember, TanggalTransaksi, NamaKasir
FROM kasir INNER JOIN transaksi
ON kasir.IdKasir = transaksi.IdKasir
INNER JOIN MemberIndomaret
ON transaksi.IdMember = MemberIndomaret.IdMember;

-- EQUI JOIN

SELECT NamaMember, IdTransaksi, TotalBelanja
FROM MemberIndomaret, transaksi
WHERE MemberIndomaret.IdMember = transaksi.IdMember;

-- LEFT JOIN
SELECT NamaBarang, IdTransaksi, subtotal
FROM barang LEFT JOIN DetailTransaksi
ON barang.IdBarang = DetailTransaksi.IdBarang;


-- RIGHT JOIN
SELECT NamaBarang, IdTransaksi, subtotal
FROM barang RIGHT JOIN DetailTransaksi
ON barang.IdBarang = DetailTransaksi.IdBarang;

-- FULL JOIN
SELECT A.NamaBarang AS barang1, B.NamaBarang AS barang2, A.HargaBarang
FROM barang A, barang B
WHERE A.HargaBarang = B.HargaBarang AND A.IdBarang <> B.IdBarang;

START TRANSACTION; -- Memulai transaksi

INSERT INTO transaksi(Idtransaksi, TanggalTransaksi, JamTransaksi, IdMember, IdKasir, TotalBelanja, IdMetodePembayaran, JumlahBayar, Kembali) 
VALUES ('TR042','2026-02-18','09:00:00','MI001','KS001',50000,'MP001',50000,0);

-- Jika terjadi kesalahan di sini, kita bisa membatalkannya
ROLLBACK; 

-- Jika semua data sudah benar, kita simpan permanen
COMMIT;

SELECT * FROM transaksi;

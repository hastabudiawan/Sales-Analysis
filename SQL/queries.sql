-- Lihat 10 baris pertama
SELECT * FROM superstore LIMIT 10;

-- Jumlah baris dan jumlah pesanan unik
SELECT COUNT(*) AS total_baris,
       COUNT(DISTINCT "Order ID") AS total_pesanan
FROM superstore;

-- Total revenue dan profit
SELECT ROUND(SUM(Sales), 2)  AS total_revenue,
       ROUND(SUM(Profit), 2) AS total_profit
FROM superstore;

-- Revenue dan profit per tahun
SELECT substr("Order Date", -4) AS tahun,
       ROUND(SUM(Sales), 2)  AS revenue,
       ROUND(SUM(Profit), 2) AS profit
FROM superstore
GROUP BY tahun
ORDER BY tahun;

-- Revenue per bulan
SELECT substr("Order Date", -4) AS tahun,
       CAST(substr("Order Date", 1, instr("Order Date", '/') - 1) AS INTEGER) AS bulan,
       ROUND(SUM(Sales), 2) AS revenue
FROM superstore
GROUP BY tahun, bulan
ORDER BY tahun, bulan;

-- Profit per kategori dan margin
SELECT Category,
       ROUND(SUM(Sales), 2)  AS revenue,
       ROUND(SUM(Profit), 2) AS profit,
       ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS margin_persen
FROM superstore
GROUP BY Category
ORDER BY profit DESC;

-- Profit per sub-kategori (cari yang merugi)
SELECT "Sub-Category",
       ROUND(SUM(Profit), 2) AS profit
FROM superstore
GROUP BY "Sub-Category"
ORDER BY profit ASC;

-- Performa per region dan segmen
SELECT Region, Segment,
       ROUND(SUM(Sales), 2)  AS revenue,
       ROUND(SUM(Profit), 2) AS profit
FROM superstore
GROUP BY Region, Segment
ORDER BY revenue DESC;

-- 10 produk dengan profit tertinggi
SELECT "Product Name", ROUND(SUM(Profit), 2) AS profit
FROM superstore
GROUP BY "Product Name"
ORDER BY profit DESC
LIMIT 10;

-- 10 produk dengan kerugian terbesar
SELECT "Product Name", ROUND(SUM(Profit), 2) AS profit
FROM superstore
GROUP BY "Product Name"
ORDER BY profit ASC
LIMIT 10;

-- 10 pelanggan dengan revenue tertinggi
SELECT "Customer Name", ROUND(SUM(Sales), 2) AS revenue
FROM superstore
GROUP BY "Customer Name"
ORDER BY revenue DESC
LIMIT 10;

-- Pengaruh diskon terhadap profit
SELECT Discount,
       COUNT(*) AS jumlah_transaksi,
       ROUND(AVG(Profit), 2) AS rata_rata_profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;
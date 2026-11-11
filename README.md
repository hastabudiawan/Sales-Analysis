# Sales Analysis
### Dari SQL sampai Dashboard: SQL, Python, Excel, Power BI, dan Tableau

> Menganalisis performa penjualan sebuah toko ritel selama 4 tahun: tren, kategori, region, segmen pelanggan, dan pengaruh diskon terhadap profit.

---

## Ringkasan Proyek

| | |
|---|---|
| **Peran analis** | Sales Analyst |
| **Dataset** | Superstore Sales (Kaggle) |
| **Periode** | 2014-2017 |
| **Ukuran data** | ±9.994 baris, 21 kolom |
| **Tools** | SQL (SQLite), Python (pandas), Excel, Power BI, Tableau Public |


---

## 1. Pertanyaan Bisnis

1. Bagaimana tren revenue dan profit dari tahun ke tahun dan bulan ke bulan?
2. Kategori, sub-kategori, dan produk mana yang paling menguntungkan, dan mana yang merugikan?
3. Region dan segmen pelanggan mana yang berkontribusi paling besar?
4. Pada level diskon berapa profit mulai merugi?
5. Siapa pelanggan paling bernilai, dan bagaimana pola pembeliannya?

---

## 2. Data

- **Sumber:** https://www.kaggle.com/datasets/vivek468/superstore-dataset-final
- **Kolom utama:** Order ID, Order Date, Ship Date, Ship Mode, Customer ID, Customer Name, Segment, Region, State, Category, Sub-Category, Product Name, Sales, Quantity, Discount, Profit

---

## 3. Tools

| Tool | Dipakai untuk | Output |
|---|---|---|
| **SQL (SQLite)** | Agregasi: revenue per kategori, per bulan, top produk, analisis diskon | `queries.sql` |
| **Python (pandas)** | Pembersihan data, growth bulanan, analisis diskon, segmentasi pelanggan | `analysis.ipynb` |
| **Excel** | PivotTable, slicer, dan sheet ringkasan untuk validasi angka | `superstore_analysis.xlsx` |
| **Power BI** | Dashboard interaktif: KPI revenue, profit, margin, dan growth | `dashboard.pbix` |
| **Tableau Public** | Visualisasi tren dan profitabilitas yang dipublikasikan | Link Tableau Public |

---

## 4. Insight

### Insight 1: Penjualan tumbuh, dengan puncak di akhir tahun
Total revenue 2014-2017 adalah **$2.297.201** dengan profit **$286.397** (margin **12,47%**).

| Tahun | Revenue | Pertumbuhan | Profit | Margin |
|---|---|---|---|---|
| 2014 | $484.247 | - | $49.544 | 10,2% |
| 2015 | $470.533 | −2,8% | $61.619 | 13,1% |
| 2016 | $609.206 | +29,5% | $81.795 | 13,4% |
| 2017 | $733.215 | +20,4% | $93.439 | 12,7% |

- Revenue turun tipis di 2015, lalu naik tajam di 2016 dan 2017.
- Pola musiman jelas: **November (15,3%)**, **Desember (14,2%)**, dan **September (13,4%)** adalah bulan terkuat. Nov-Des saja menyumbang **29,5%** dari seluruh revenue.

### Insight 2: Furniture besar di revenue, tipis di profit
| Kategori | Revenue | Profit | Margin |
|---|---|---|---|
| Technology | $836.154 | $145.455 | 17,4% |
| Furniture | $742.000 | $18.451 | **2,5%** |
| Office Supplies | $719.047 | $122.491 | 17,0% |

- Tiga sub-kategori **merugi**: **Tables (−$17.725; margin −8,6%)**, **Bookcases (−$3.473; −3,0%)**, dan **Supplies (−$1.189; −2,5%)**.
- Sub-kategori paling menguntungkan: **Copiers ($55.618)**, **Phones ($44.516)**, dan **Accessories ($41.937)**.
- Produk dengan kerugian terbesar: *Cubify CubeX 3D Printer Double Head Print* (**−$8.880**).

### Insight 3: Diskon di atas 20% hampir selalu merugi
| Level diskon | Jumlah baris transaksi | Rata-rata profit per baris |
|---|---|---|
| Tanpa diskon | 4.798 (48,0%) | +$66,9 |
| 1-20% | 3.803 (38,1%) | +$26,5 |
| 21-40% | 460 (4,6%) | **−$77,9** |
| Di atas 40% | 933 (9,3%) | **−$106,7** |

- Rata-rata profit per baris masih positif pada diskon 20% (+$24,7), dan mulai negatif pada diskon **30% (−$45,7)**.
- Transaksi berdiskon di atas 20% (13,9% dari semua baris) menghasilkan total profit **−$135.376**, setara dengan sekitar **47%** dari total profit seluruh bisnis, sedangkan transaksi berdiskon ≤20% menghasilkan **+$421.773**.
- Pada sub-kategori **Tables**, 176 dari 319 baris transaksi (55%) berdiskon di atas 20%.
- Ada pengecualian: **Binders** punya rata-rata diskon tertinggi (37%) tetapi tetap untung ($30.222), sedangkan **Supplies** merugi walau diskonnya rendah (7,7%). Jadi diskon bukan satu-satunya penyebab kerugian.

### Insight 4: Central dan beberapa state menekan profit
| Region | Revenue | Profit | Margin |
|---|---|---|---|
| West | $725.458 | $108.418 | 14,9% |
| East | $678.781 | $91.523 | 13,5% |
| Central | $501.240 | $39.706 | **7,9%** |
| South | $391.722 | $46.749 | 11,9% |

- **Central** punya margin terendah (7,9%).
- **10 dari 49 state** merugi. Terburuk: **Texas (−$25.729)**, **Ohio (−$16.971)**, **Pennsylvania (−$15.560)**. Texas adalah state dengan penjualan terbesar ketiga ($170.188), tetapi profit terburuk.
- Profit tertinggi: **California ($76.381)** dan **New York ($74.039)**.
- Segmen: **Consumer** menyumbang 50,6% revenue (margin 11,5%), **Corporate** 30,7% (margin 13,0%), dan **Home Office** 18,7% dengan margin tertinggi (**14,0%**).

### Insight 5: Pelanggan
- Ada **793 pelanggan** dengan rata-rata **6,3 order** per pelanggan. Nilai rata-rata satu order adalah **$458,6**.
- **10% pelanggan teratas (79 orang)** menyumbang **30,6%** revenue.
- **18,7%** baris transaksi (1.871 baris) merugi, dengan total kerugian **$156.131**.

---

## 5. Rekomendasi

1. **Batasi diskon di atas 20%.** Transaksi di level itu menghasilkan kerugian setara hampir setengah dari total profit. Terapkan batas diskon atau persetujuan khusus, terutama untuk **Tables, Bookcases, dan Machines**. *(Estimasi kasar: tidak semua kerugian itu bisa dihindari, tetapi ruang perbaikannya besar.)*
2. **Tinjau harga dan pemasok Tables, Bookcases, dan Supplies**, serta produk dengan kerugian terbesar seperti Cubify CubeX 3D Printer. Naikkan harga, ganti pemasok, atau hentikan produk yang terus merugi.
3. **Siapkan stok dan promosi sebelum September-Desember**, karena periode ini menyumbang porsi revenue terbesar, dan jangan mengandalkan diskon besar di musim puncak.
4. **Selidiki profitabilitas region Central serta Texas, Ohio, dan Pennsylvania.** Penjualannya besar, tetapi margin rendah atau negatif. Periksa biaya pengiriman, struktur diskon, dan mix produk di wilayah itu.
5. **Pertajam fokus pada Technology dan Office Supplies** (margin ±17%), dan perbaiki **Furniture** yang margin-nya hanya 2,5%.
6. **Jaga pelanggan teratas.** Program loyalitas untuk 10% pelanggan teratas bisa melindungi sekitar sepertiga revenue, dan segmen **Home Office** (margin tertinggi) layak mendapat perhatian lebih.

---

## 6. Hasil & Link

| Tool | Link / File |
|---|---|
| Query SQL | `queries.sql` |
| Notebook Python | `analysis.ipynb` |
| Excel | `superstore_analysis.xlsx` |
| Power BI | `dashboard.pbix` + screenshot di `images/` |
| Tableau Public | [Sales Dashboard](https://public.tableau.com/app/profile/hasta.budiawan/viz/Sales_Dashboard_17942072779350/Dashboard1) |

---
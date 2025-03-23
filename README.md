
# Football Data Analysis

## 📌 Overview
Proyek ini bertujuan untuk menganalisis data sepak bola menggunakan **Principal Component Analysis (PCA)** dan **Factor Analysis (FA)**. Analisis ini membantu mengidentifikasi faktor utama yang mempengaruhi performa tim dan pemain.

## 📂 Dataset
Dataset yang digunakan dalam proyek ini adalah `bolaANMUL.csv`, yang berisi berbagai statistik numerik terkait sepak bola.

## 📊 Analisis yang Dilakukan
1. **Pengecekan Data**:
   - Mengecek struktur dan nilai yang hilang dalam dataset.
   - Menampilkan statistik deskriptif.

2. **Principal Component Analysis (PCA)**:
   - Standarisasi data.
   - Menghitung eigenvalues dan eigenvectors.
   - Visualisasi dengan **scree plot** dan **biplot**.
   - Interpretasi hasil PCA.

3. **Factor Analysis (FA)**:
   - Mengekstraksi faktor utama.
   - Menggunakan metode rotasi **Varimax** untuk interpretasi lebih baik.
   - Visualisasi hasil dengan diagram faktor.

## 🛠 Tools dan Library yang Digunakan
- **R programming**
- `psych` (untuk PCA & FA)
- `FactoMineR` (untuk PCA)
- `factoextra` (untuk visualisasi)
- `dplyr` (untuk manipulasi data)

## 🚀 Cara Menjalankan Kode
1. Pastikan Anda memiliki **R dan RStudio** terinstal.
2. Install package yang diperlukan:
   ```r
   install.packages(c("psych", "FactoMineR", "factoextra", "dplyr"))
   ```
3. Jalankan skrip **PCA dan FA** dalam RStudio.

## 📈 Visualisasi
Proyek ini menyertakan berbagai bentuk visualisasi seperti:
- **Histogram statistik sepak bola**
- **Scree plot PCA**
- **Biplot PCA**
- **Diagram kontribusi variabel**
- **Diagram faktor hasil FA**

## 📌 Catatan
- Pastikan dataset `bolaANMUL.csv` tersedia dalam direktori yang benar.
- Jika mengalami error saat running kode, cek dependensi library yang diperlukan.

## 📄 Lisensi
Proyek ini menggunakan lisensi **MIT** - Silakan digunakan dan dikembangkan lebih lanjut.

---

🎯 *Dikembangkan oleh Rafly Anugrah Syahputra ,Muhammad Rarendra Satiya - Universitas Negeri Surabaya* 🎯


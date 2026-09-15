# Dokumentasi 
tugasn 4 
Aplikasi Flutter ini dibuat untuk mendemonstrasikan implementasi **Navigation & Routing**, penggunaan **StatelessWidget** dan **StatefulWidget**, serta konversi data **JSON Serializability (UserModel)**.

---

## 📌 Fitur Aplikasi
1. **Screen 1 (Beranda / Katalog):**
   - Menggunakan `StatelessWidget`.
   - Menampilkan daftar 3 pengguna dalam bentuk `ListView` dan `Card`.
   - Melakukan parsing/deserialization dari mock data JSON ke objek `UserModel`.
2. **Screen 2 (Detail Katalog):**
   - Menggunakan `StatefulWidget`.
   - Menampilkan detail profil pengguna (Nama, ID, Email, Telepon, Alamat) menggunakan layout `Column` dan `Container` berlatar warna pastel.
   - Dilengkapi tombol interaktif untuk mengubah state (Bookmark / Simpan ke Favorit).
3. **Navigasi:**
   - Perpindahan halaman menggunakan `Navigator.push` (Stack Navigation).
   - Tombol *Back* di `AppBar` otomatis disediakan oleh kerangka `Scaffold`.

---

## 🚀 Panduan Setup & Menjalankan Project

### Prasyarat System:
- Flutter SDK (versi terbaru/3.x)
- Dart SDK
- Android Studio / VS Code
- Android Emulator / Perangkat HP fisik

### Langkah-langkah Memulai:
1. **Clone Repository ini:**
   ```bash
   git clone https://github.com/kayla200507-stack/Mobile-Dev.git 

   # Tugas #5 Mobile Developer - Navigasi, event & State Management Flutter

## Fitur Utama

1. **Screen 1 (Katalog Utama)**:
   - Dibuat menggunakan `StatelessWidget`.
   - Menampilkan daftar 3 produk menggunakan `ListView`, `Card`, dan `ListTile`.
   - Navigasi ke halaman detail menggunakan `Navigator.push`.

2. **Screen 2 (Detail Katalog)**:
   - Dibuat menggunakan `StatefulWidget`.
   - Tata letak vertikal menggunakan `Column`.
   - Menampilkan nama, harga, dan deskripsi produk di dalam `Container` berlatar warna pastel.
   - Fitur interaktif (*Event & State*) untuk menyukai produk (*Favorite Toggle*) dan mengatur jumlah pesanan.
   - Navigasi kembali menggunakan tombol *Back* pada `AppBar`.

---

## Panduan Setup & Memulai Project

### Prasyarat
- Flutter SDK (Versi terbaru)
- Dart SDK
- Android Studio / VS Code (dengan ekstensi Flutter & Dart)

### Perintah Menjalankan Aplikasi

1. Cloning repositori ini:
   ```bash
   git clone [https://github.com/username/repository-anda.git](https://github.com/username/repository-anda.git)
# My Notes App

Aplikasi pencatatan (Note App) yang simpel, cepat, dan elegan, dibangun menggunakan **Flutter** dengan **sqflite** untuk penyimpanan database lokal. Aplikasi ini dirancang agar pengguna dapat mengelola catatan mereka dengan mudah, didukung dengan antarmuka yang bersih dan transisi tema yang mulus.

## ✨ Fitur Utama

* **Operasi CRUD Lengkap**: Pengguna dapat membuat (*Create*), membaca (*Read*), mengedit (*Update*), dan menghapus (*Delete*) catatan.
* **Struktur Data Lengkap**: Setiap catatan dapat memuat **Judul**, **Isi Catatan**, dan **Nama Penulis** (Author).
* **Database Offline**: Menggunakan `sqflite` untuk menyimpan data secara lokal, sehingga aplikasi tidak memerlukan koneksi internet dan menjaga privasi data pengguna.
* **Tema Terang & Gelap (Light/Dark Mode)**: Mendukung mode tampilan terang dan gelap yang dapat diubah (toggle) dengan mudah melalui ikon bulan/matahari di AppBar. Tampilan disesuaikan dengan nyaman untuk kedua mode.
* **Desain Antarmuka Modern**: Menampilkan catatan dalam bentuk *Grid* bergaya kartu (*card*) yang responsif.

## 📸 Tangkapan Layar (Screenshots)

| Beranda (Light Mode) | Beranda (Dark Mode) | Detail Catatan (Light) | Detail Catatan (Dark) |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/c7665150-53da-4253-820d-367839f9bea4" width="160" /> | <img src="https://github.com/user-attachments/assets/69b378bf-8ea7-45e5-be13-73590dbb3b73" width="160" /> | <img src="https://github.com/user-attachments/assets/75b7a1e3-ed5a-4d01-809c-3965d60fb4ea" width="160" /> | <img src="https://github.com/user-attachments/assets/08dba5bf-ada6-4c4c-82fa-7cd1231bd572" width="160" /> |

## 🛠️ Teknologi yang Digunakan

* **[Flutter](https://flutter.dev/)**: Framework UI untuk membangun antarmuka aplikasi.
* **[sqflite](https://pub.dev/packages/sqflite)**: Plugin SQLite untuk Flutter yang menangani manajemen database lokal.
* **[path_provider](https://pub.dev/packages/path_provider)**: Untuk menemukan lokasi sistem file tempat menyimpan database.

## 🚀 Cara Menjalankan Proyek (Getting Started)

Ikuti langkah-langkah berikut untuk menjalankan kode sumber aplikasi ini di lingkungan lokal Anda.

### Prasyarat

Pastikan Anda telah menginstal Flutter SDK di komputer Anda. Jika belum, silakan merujuk ke [Dokumentasi Instalasi Flutter](https://docs.flutter.dev/get-started/install).

### Instalasi dan Menjalankan Aplikasi

1.  **Clone repositori ini:**
    ```bash
    git clone [https://github.com/username-anda/nama-repo-anda.git](https://github.com/username-anda/nama-repo-anda.git)
    ```

2.  **Masuk ke direktori proyek:**
    ```bash
    cd nama-repo-anda
    ```

3.  **Unduh semua dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Jalankan aplikasi:**
    ```bash
    flutter run
    ```

## 📂 Skema Database Lokal

Tabel database `notes` dibangun dengan struktur berikut:

| Kolom | Tipe Data | Keterangan |
| :--- | :--- | :--- |
| `id` | INTEGER | Primary Key, Auto Increment |
| `title` | TEXT | Judul utama catatan |
| `content` | TEXT | Isi/detail dari catatan |
| `author` | TEXT | Nama penulis atau pembuat catatan |

---

**Dibuat dengan ❤️ menggunakan Flutter.**

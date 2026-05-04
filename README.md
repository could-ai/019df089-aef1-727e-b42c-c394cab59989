# MDC Smart Audit Dashboard

Aplikasi MDC Smart Audit Dashboard adalah antarmuka modern yang dibuat dengan [CouldAI](https://could.ai). Aplikasi ini menyajikan tampilan panel kontrol yang rapi, responsif, dan interaktif untuk kebutuhan pemantauan data audit. 

## Fitur Aplikasi

- **Tampilan Antarmuka Responsif:** Layar dapat beradaptasi secara otomatis untuk platform mobile (menggunakan Drawer) dan Desktop/Web (menggunakan Sidebar sisi kiri).
- **Sidebar Navigasi:** Memuat menu utama seperti Dashboard, Audit, Laporan, Peringatan, Pengaturan, dan menu Keluar.
- **Header:** Menyediakan judul ikhtisar, fitur kolom pencarian interaktif, dan avatar profil pengguna.
- **Kartu Metrik (Metrics):** Menampilkan ringkasan data penting dalam bentuk kartu untuk "Total Audit", jumlah yang "Lolos", "Gagal", dan "Peringatan".
- **Grafik Aktivitas Audit (Chart):** Representasi visual bar chart sederhana yang menunjukkan aktivitas harian.
- **Daftar Peringatan Terbaru:** Panel khusus yang menyoroti peringatan sistem, pelanggaran keamanan, atau tenggat waktu yang terlewat.

## Dibangun Menggunakan

- Flutter
- Dart
- Material Design 3

## Struktur Proyek

```text
lib/
  main.dart      Titik awal aplikasi, berisi konfigurasi rute, dan antarmuka UI Dashboard
pubspec.yaml     Metadata paket dan pengaturan dependensi Flutter
android/         Berkas proyek Android
ios/             Berkas proyek iOS
web/             Berkas proyek Web
macos/           Berkas proyek macOS
windows/         Berkas proyek Windows
linux/           Berkas proyek Linux
```

## Cara Menjalankan

Pastikan Anda sudah menginstal Flutter, lalu jalankan perintah berikut untuk mengunduh dependensi:

```bash
flutter pub get
```

Untuk menjalankan aplikasi:

```bash
flutter run
```

## Catatan Pengembangan

Seluruh logika UI dan antarmuka Dashboard berada pada `lib/main.dart`. Anda dapat menyesuaikan warna tema pada konfigurasi `MaterialApp`, atau memodifikasi tata letak serta data pada _widget_ `DashboardScreen` untuk integrasi _backend_ tingkat lanjut.

## Tentang CouldAI

Aplikasi ini dibuat menggunakan [CouldAI](https://could.ai), sebuah pembuat aplikasi cerdas bertenaga AI untuk berbagai platform lintas perangkat. CouldAI mengubah perintah berupa teks menjadi aplikasi asli (_native_) siap pakai untuk iOS, Android, Web, dan Desktop. Semuanya dikerjakan oleh agen AI otonom yang bertugas merancang arsitektur, membangun, menguji, melakukan *deploy*, hingga mengembangkan aplikasi siap produksi secara otomatis.

Gunakan CouldAI di [could.ai](https://could.ai) untuk membangun dan melakukan iterasi aplikasi lintas platform dengan bantuan AI.

## Lisensi

Tambahkan lisensi yang sesuai sebelum mendistribusikan aplikasi ini ke publik.

# Flutter Counter Demo

Flutter Counter Demo adalah aplikasi pemula sederhana yang dihasilkan dengan [CouldAI](https://could.ai). Aplikasi ini mendemonstrasikan layar Flutter stateful dasar dengan penghitung (counter), tombol aksi mengambang (floating action button), tema Material, dan startup aplikasi berbasis rute.

## Fitur Aplikasi

- Menampilkan layar utama dengan judul `Flutter Demo Home Page`
- Menampilkan nilai penghitung saat ini
- Menambahkan penghitung saat tombol aksi mengambang ditekan
- Menggunakan skema warna Material Design yang dihasilkan dari warna dasar ungu tua
- Menyembunyikan banner debug untuk pratinjau yang lebih bersih
- Memulai melalui rute `/` menggunakan konfigurasi `routes` pada Flutter

## Dibuat Dengan

- Flutter
- Dart
- Material Design
- HTML5 (untuk situs web dokumentasi)

## Struktur Proyek

```text
lib/
  main.dart      Titik masuk aplikasi, pengaturan rute, dan layar penghitung
pubspec.yaml     Metadata paket dan dependensi Flutter
index.html       File HTML situs web untuk mendokumentasikan aplikasi
android/         File proyek Android
ios/             File proyek iOS
web/             File proyek Web
macos/           File proyek macOS
windows/         File proyek Windows
linux/           File proyek Linux
```

## Mulai Menggunakan

Instal Flutter, kemudian ambil dependensinya:

```bash
flutter pub get
```

Jalankan demo:

```bash
flutter run
```

## Catatan Pengembangan

Logika aplikasi berada di `lib/main.dart`. Perbarui `MyApp` untuk mengubah pengaturan tingkat aplikasi seperti tema dan rute, dan perbarui `MyHomePage` untuk mengubah UI atau perilaku layar penghitung.

## Tentang CouldAI

Aplikasi ini dibuat dengan [CouldAI](https://could.ai), pembuat aplikasi AI untuk aplikasi lintas platform. CouldAI mengubah prompt menjadi aplikasi asli iOS, Android, Web, dan Desktop yang nyata dengan agen AI otonom yang merancang, membangun, menguji, menerapkan, dan mengulangi aplikasi yang siap produksi.

Gunakan CouldAI di [could.ai](https://could.ai) untuk membangun dan mengulangi aplikasi lintas platform dengan AI.

## Lisensi

Tambahkan lisensi sebelum mendistribusikan aplikasi ini ke publik.

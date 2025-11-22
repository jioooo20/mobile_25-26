# Laporan Praktikum PEMROGRAMAN MOBILE

| Nama      | NIM      | Kelas      | Mata Kuliah | Semester |
|-----------|----------|------------|-------------|----------|
| Giovano Alkandri | 2341720096| TI-3H| PEMROGRAMAN MOBILE    | 5        |


## Praktikum 1 W13 Soal 2
- Masukkan hasil capture layar ke laporan praktikum Anda.
![IMAGE](/w13/store_data_giovano/img/soal2.png)
  
## Praktikum 1 W13 Soal 3
- Masukkan hasil capture layar ke laporan praktikum Anda.
![IMAGE](/w13/store_data_giovano/img/soal3.png)

## Praktikum 2 W13 Soal 4
- Masukkan hasil capture layar ke laporan praktikum Anda.
![IMAGE](/w13/store_data_giovano/img/soal4.png)
  
## Praktikum 3 W13 Soal 5
- Masukkan hasil capture layar ke laporan praktikum Anda.
![IMAGE](/w13/store_data_giovano/img/soal5.png)

- Jelaskan maksud kode lebih safe dan maintainable!

  **Penjelasan Kode Lebih Safe dan Maintainable:**

  Kode pada class `Pizza` (dalam `pizza.dart`) menerapkan prinsip-prinsip yang membuat aplikasi lebih aman dan mudah dipelihara:

  1. **Penggunaan Konstanta untuk Key**
     ```dart
     static const keyId = 'id';
     static const keyName = 'pizzaName';
     ```
     - Menggunakan konstanta untuk nama field JSON mencegah typo
     - Memudahkan refactoring karena cukup mengubah di satu tempat
     - Mengurangi kesalahan penulisan string literal yang berulang

  2. **Null Safety dengan Operator `??` dan `tryParse()`**
     ```dart
     id = int.tryParse(json[keyId]) ?? 0,
     pizzaName = json[keyName] != '' ? json[keyName].toString() : 'No Name',
     price = double.tryParse(json[keyprice].toString()) ?? 0,
     ```
     - `tryParse()` mencegah crash saat konversi tipe data gagal
     - Operator `??` memberikan nilai default jika data null
     - Validasi string kosong mencegah data yang tidak valid

  3. **Type Safety**
     - Semua property menggunakan tipe data yang jelas (`int`, `String`, `double`)
     - Kompiler dapat mendeteksi kesalahan tipe data sejak awal
     - Mengurangi runtime error

  4. **Encapsulation dengan Constructor**
     - Menggunakan named constructor `fromJson()` untuk parsing data
     - Method `toJson()` untuk serialisasi kembali ke JSON
     - Memisahkan logika parsing dari logika bisnis lainnya

  Dengan pendekatan ini, aplikasi lebih **safe** (aman dari crash dan error) dan **maintainable** (mudah dipelihara dan dimodifikasi).
  

## Praktikum 4 W13 Soal 6
- Masukkan hasil capture layar ke laporan praktikum Anda.
![IMAGE](/w13/store_data_giovano/img/soal6.gif)

## Praktikum 5 W13 Soal 7
- Masukkan hasil capture layar ke laporan praktikum Anda.
![IMAGE](/w13/store_data_giovano/img/soal7.png)

## Praktikum 6 W13 Soal 8
- Masukkan hasil capture layar ke laporan praktikum Anda.
![IMAGE](/w13/store_data_giovano/img/soal8.mp4)

- Jelaskan maksud kode pada langkah 3 dan 7 !

  **Penjelasan Kode Langkah 3 dan 7:**

  **Langkah 3 - Method `writeFile()`:**
  ```dart
  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }
  ```
  
  Method ini berfungsi untuk menulis data ke file di storage device:
  - **`Future<bool>`**: Mengembalikan nilai boolean secara asynchronous untuk mengindikasikan apakah penulisan berhasil atau tidak
  - **`async/await`**: Menggunakan asynchronous programming karena operasi file I/O membutuhkan waktu
  - **`myFile.writeAsString()`**: Menulis string 'Margherita, Capricciosa, Napoli' ke dalam file
  - **`try-catch`**: Error handling untuk menangani kemungkinan error (misalnya: permission denied, storage full)
  - **Return value**: `true` jika berhasil, `false` jika terjadi error
  
  **Langkah 7 - Menampilkan Path dan Data:**
  
  Pada langkah 7, ditambahkan UI untuk menampilkan:
  1. **documentsPath**: Path direktori dokumen aplikasi (`/data/user/0/com.example.store_data_giovano/app_flutter`)
  2. **tempPath**: Path direktori temporary/cache (`/data/user/0/com.example.store_data_giovano/cache`)
  3. **Button "Read File"**: Tombol untuk membaca data dari file yang telah ditulis
  4. **Data yang dibaca**: Menampilkan isi file (dalam screenshot terlihat "2341720096 giovaon")
  
  Kode ini mendemonstrasikan:
  - Penggunaan `path_provider` package untuk mendapatkan direktori storage
  - Perbedaan antara documents directory (untuk data permanen) dan temp directory (untuk data sementara)
  - Implementasi read/write file di Flutter menggunakan persistent storage
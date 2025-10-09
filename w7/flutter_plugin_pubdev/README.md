# Laporan Praktikum PEMROGRAMAN MOBILE

| Nama      | NIM      | Kelas      | Mata Kuliah | Semester |
|-----------|----------|------------|-------------|----------|
| Giovano Alkandri | 2341720096| TI-3H| PEMROGRAMAN MOBILE    | 5        |

## Langkah 2 pada Praktikum

>Gambar di bawah ini menunjukkan perbandingan antara penggunaan plugin AutoSizeText dan widget Text biasa di Flutter. Pada kotak kuning, teks menggunakan AutoSizeText yang otomatis menyesuaikan ukuran huruf agar muat di dalam container berukuran sempit, meskipun sebagian teks masih tampak terpotong karena ruangnya sangat terbatas. Sementara itu, pada kotak hijau, teks menggunakan widget Text biasa yang tidak menyesuaikan ukuran font, melainkan membungkus teks ke beberapa baris agar seluruh kalimat tetap terlihat. Perbandingan ini menunjukkan bahwa AutoSizeText berguna untuk mengontrol ukuran font secara adaptif, sedangkan Text biasa hanya menampilkan teks sesuai batas lebar container tanpa mengubah ukuran huruf.

![Image](/w7/layout_flutter/img/image.png)

## Langkah 2 pada Praktikum

```dart
flutter pub add auto_size_text
```

>Perintah tersebut digunakan untuk menambahkan plugin bernama auto_size_text


## Langkah 5 pada Praktikum

```dart
final String text;
const RedTextWidget({Key? key, required this.text}) : super(key: key);
```

>Kode ini adalah definisi bagian dari constructor untuk sebuah StatelessWidget bernama RedTextWidget dalam Flutter/Dart. final String text mendeklarasikan sebuah immutable property (tidak dapat diubah setelah inisialisasi) bertipe String yang akan menyimpan teks yang akan ditampilkan widget. Constructor const RedTextWidget({Key? key, required this.text}) : super(key: key) menggunakan named parameters dengan key sebagai parameter opsional dan text sebagai parameter wajib (ditandai required), serta menggunakan const constructor untuk optimasi performa Flutter dengan memungkinkan widget di-cache jika propertinya sama. Initializer list : super(key: key) memanggil constructor parent class (StatelessWidget) dan meneruskan parameter key untuk keperluan widget tree identification dan optimasi rebuild dalam Flutter.


## Langkah 6 pada Praktikum

>Pada container pertama berwarna kuning, width selebar 50 dan memiliki child dengan fungsi RedTextWidget, pada fungsi tersebut berisi style text color berwarna merah dan font 14, max panjang 2 baris, dan ketika overflow akan disembunyikan. jadi ketika teks di dalam container tersebut melebihi ukuran container, maka akan langusung di cut.

>Sedangkan pada container kedua yang berwarna kuning dan width selebar 100, namun menggunakan Text biasa.

## Penjelasan tiap paramter pada plugin auto_size_text
Parameter auto_size_text dan fungsinya:

- key: Mengontrol bagaimana widget mengganti widget lain dalam widget tree
- textKey: Menetapkan key untuk widget Text yang dihasilkan
- style: Mengatur gaya teks seperti warna, font family, dan properti styling lainnya
- minFontSize: Ukuran font minimum saat auto-sizing (diabaikan jika presetFontSizes digunakan)
- maxFontSize: Ukuran font maksimum saat auto-sizing (diabaikan jika presetFontSizes digunakan)
- stepGranularity: Langkah perubahan ukuran font untuk menyesuaikan dengan constraints
- presetFontSizes: Daftar ukuran font yang telah ditentukan (harus berurutan menurun)
- group: Menyinkronkan ukuran beberapa AutoSizeText secara bersamaan
- textAlign: Pengaturan alignment teks secara horizontal
- textDirection: Arah teks (kiri-ke-kanan atau kanan-ke-kiri)
- locale: Pemilihan font berdasarkan lokalisasi untuk karakter Unicode
- softWrap: Mengatur apakah teks dapat dipecah di soft line breaks
- wrapWords: Mengatur pembungkusan kata yang tidak muat dalam satu baris
- overflow: Menangani visual overflow pada teks
- overflowReplacement: Widget pengganti ketika teks overflow dan tidak muat
- textScaleFactor: Rasio pixel font terhadap logical pixel
- maxLines: Jumlah maksimum baris untuk teks
- semanticsLabel: Label semantik alternatif untuk accessibility

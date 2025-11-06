# Laporan Praktikum PEMROGRAMAN MOBILE

| Nama      | NIM      | Kelas      | Mata Kuliah | Semester |
|-----------|----------|------------|-------------|----------|
| Giovano Alkandri | 2341720096| TI-3H| PEMROGRAMAN MOBILE    | 5        |


## Praktikum 1 W11 Soal 2
![Image](/w11/books/img/img1.png)


## Praktikum 1 W11 Soal 3
- substring() = metode untuk mengambil sebagian teks dari sebuah string berdasarkan indeks posisi
- CatchError() = blok untuk menangani error/exception yang terjadi dalam operasi asynchronous (seperti Future)


## Praktikum 2 W11 Soal 4
![GIF](/w11/books/img/gif2.gif)


## Praktikum 3 W11 Soal 5
![GIF](/w11/books/img/gif3.gif)


## Praktikum 3 W11 Soal 6
>Perbedaan kode tersebut ialah adanya error handling dalam calculate() dan error handling pada di pemanggilan getnumber(). error handling berfungsi untuk menampilkan error tanpa membuat aplikasi tersebut crash


## Praktikum 4 W11 Soal 7
![GIF](/w11/books/img/gif4.gif)

## Praktikum 4 W11 Soal 8
Jelaskan maksud perbedaan kode langkah 1 dan 4!
>Future.wait menerima list Future yang sudah ditentukan dari awal dan langsung mengeksekusi semuanya sekaligus, sehingga lebih ringkas dan cocok untuk kasus dimana semua Future sudah diketahui sejak awal. Sementara FutureGroup memungkinkan penambahan Future secara dinamis menggunakan method add() dan harus explicitly ditutup dengan close(), membuatnya lebih fleksibel untuk skenario dimana Future perlu ditambahkan secara bertahap atau conditional selama runtime. 


## Praktikum 5 W11 Soal 9
![GIF](/w11/books/img/gif5.gif)

## Praktikum 5 W11 Soal 10
>Perbedaan utama terletak pada pendekatan penanganan error: kode pertama menggunakan method chaining dengan .then().catchError().whenComplete() yang khas untuk pattern Future-based, dimana error ditangani secara terpisah melalui catchError dan completion handling via whenComplete. Sedangkan kode kedua menggunakan async/await dengan try-catch-finally yang lebih synchronous-like dan readable, dimana semua flow (success, error, completion) ditangani dalam satu blok terstruktur dengan catch untuk error dan finally untuk cleanup, membuat kode lebih terorganisir dan mudah dibaca terutama untuk logika yang kompleks.
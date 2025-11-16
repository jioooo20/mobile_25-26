# Laporan Praktikum PEMROGRAMAN MOBILE

| Nama      | NIM      | Kelas      | Mata Kuliah | Semester |
|-----------|----------|------------|-------------|----------|
| Giovano Alkandri | 2341720096| TI-3H| PEMROGRAMAN MOBILE    | 5        |


## Praktikum 1 W12 Soal 3
- Jelaskan fungsi keyword yield* pada kode tersebut!
  
  **Jawaban:**
  
  Keyword `yield*` digunakan untuk men-delegate atau meneruskan semua nilai dari Stream lain ke Stream yang sedang dibuat. Dalam kode `stream.dart`, `yield*` meneruskan semua nilai yang dihasilkan oleh `Stream.periodic` ke Stream yang dikembalikan oleh method `getColorStream()`. Jadi, alih-alih meng-yield satu per satu nilai secara manual, `yield*` secara otomatis meneruskan seluruh sequence nilai dari Stream yang di-delegate.

- Apa maksud isi perintah kode tersebut?
  
  **Jawaban:**
  
  Kode tersebut membuat sebuah Stream yang menghasilkan objek `Color` secara periodik setiap 1 detik. `Stream.periodic` membuat Stream yang emit nilai berdasarkan interval waktu tertentu. Parameter `(int t)` adalah counter yang increment setiap interval (dimulai dari 0, 1, 2, dst). Dengan `t % colors.length`, kode menghitung index dalam list colors secara berulang (0-9, kemudian kembali ke 0), sehingga Stream akan terus menghasilkan warna-warna dari list `colors` secara berurutan dan berulang tanpa henti.

## Praktikum 1 W12 Soal 4
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![GIF]('/img/soal4.gif')

## Praktikum 1 W12 Soal 5
- Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !

  **Jawaban:**
  
  Perbedaan utama antara `listen` dan `await for`:

  **1. listen:**
  - Bersifat **asynchronous non-blocking**, kode setelah `listen` akan tetap dieksekusi tanpa menunggu Stream selesai
  - Menggunakan callback function untuk menangani setiap event yang datang
  - Lebih fleksibel karena bisa mengatur `onError`, `onDone`, dan `cancelOnError`
  - Cocok untuk Stream yang berjalan di background tanpa memblokir eksekusi kode lain
  - Contoh: `stream.listen((event) { /* handle event */ });`

  **2. await for:**
  - Bersifat **synchronous blocking**, kode akan menunggu di loop ini sampai Stream selesai atau di-break
  - Menggunakan loop untuk iterasi, membuat kode lebih mudah dibaca seperti loop biasa
  - Harus berada dalam function yang ditandai `async`
  - Memblokir eksekusi kode berikutnya sampai loop selesai
  - Cocok untuk memproses Stream secara sequential dan mengontrol flow dengan lebih mudah
  - Contoh: `await for (var event in stream) { /* handle event */ }`

  **Kesimpulan:** Gunakan `listen` jika ingin Stream berjalan di background tanpa memblokir kode lain, gunakan `await for` jika perlu memproses Stream secara berurutan dan memblokir eksekusi sampai selesai.

## Praktikum 1 W12 Soal 6
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![GIF]('/img/soal6.gif')

- Jelaskan maksud kode langkah 8 dan 10 tersebut!

  **Jawaban:**

  **Langkah 8 - Method `initState()`:**
  ```dart
  void initState() {
    numberStream = NumberStream();
    numberStream.stream.listen((eventNumber) {
      setState(() {
        lastNumber = eventNumber;
      });
    });
    super.initState();
  }
  ```
  
  Method `initState()` dipanggil sekali saat widget pertama kali dibuat (initialization). Di dalamnya:
  - `numberStream = NumberStream()` membuat instance baru dari class `NumberStream` yang mengelola StreamController
  - `numberStream.stream.listen()` men-subscribe ke Stream untuk mendengarkan setiap data yang masuk
  - Setiap kali ada data baru (`eventNumber`) yang di-emit ke Stream, callback function akan dijalankan
  - `setState(() { lastNumber = eventNumber; })` mengupdate nilai `lastNumber` dengan nilai terbaru dari Stream dan memicu rebuild UI untuk menampilkan angka terbaru
  - Dengan kata lain, kode ini **setup listener** yang siap menangkap dan menampilkan angka yang dikirim ke Stream

  **Langkah 10 - Method `addRandomNumber()`:**
  ```dart
  void addRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    numberStream.addNumberToSink(randomNumber);
  }
  ```
  
  Method ini dipanggil saat tombol "Add Random Number" ditekan. Prosesnya:
  - `Random()` membuat instance generator angka acak
  - `random.nextInt(10)` menghasilkan angka acak dari 0-9
  - `numberStream.addNumberToSink(randomNumber)` mengirim/memasukkan angka acak tersebut ke dalam Stream melalui Sink
  - Angka ini kemudian akan diterima oleh listener di `initState()` dan ditampilkan di UI

  **Hubungan kedua kode:**
  - `initState()` = **Listener/Penerima** yang menunggu data dari Stream
  - `addRandomNumber()` = **Sender/Pengirim** yang mengirim data ke Stream
  - Mereka bekerja dengan pola **Producer-Consumer** menggunakan Stream sebagai jembatan komunikasi asynchronous



## Praktikum 1 W12 Soal 7

![GIF]('/img/soal7.gif')

- Jelaskan maksud kode langkah 13 sampai 15 tersebut!

  **Jawaban:**

  **Langkah 13 - Method `addError()` di class `NumberStream`:**
  ```dart
  addError(){
    _controller.sink.addError("error");
  }
  ```
  
  Method ini digunakan untuk mengirimkan error ke dalam Stream. `_controller.sink.addError("error")` akan memasukkan sebuah error dengan pesan "error" ke dalam Stream melalui Sink. Error ini nantinya akan ditangkap oleh error handler di listener.

  **Langkah 14 - Error Handler `onError()` di `initState()`:**
  ```dart
  }).onError((error){
    setState(() {
      lastNumber = -1;
    });
  });
  ```
  
  Ini adalah error handler yang ditambahkan pada listener Stream. Ketika Stream menerima error (yang dikirim melalui `addError()`):
  - Callback `onError` akan dijalankan
  - `setState(() { lastNumber = -1; })` mengubah nilai `lastNumber` menjadi -1 sebagai indikator bahwa terjadi error
  - UI akan diupdate untuk menampilkan nilai -1 di layar

  **Langkah 15 - Modifikasi method `addRandomNumber()`:**
  ```dart
  void addRandomNumber() {
    Random random = Random();
    // int randomNumber = random.nextInt(10);
    // numberStream.addNumberToSink(randomNumber);
    numberStream.addError();
  }
  ```
  
  Method ini dimodifikasi untuk mengirim error ke Stream instead of mengirim angka random:
  - Kode lama (yang di-comment) mengirim angka random ke Stream
  - Kode baru `numberStream.addError()` mengirim error ke Stream
  - Ketika tombol "Add Random Number" ditekan, akan memicu error handler dan menampilkan -1 di layar

  **Kesimpulan:**
  Ketiga kode ini bekerja sama untuk mendemonstrasikan **error handling dalam Stream**:
  1. `addError()` = mengirim error ke Stream
  2. `onError()` = menangkap dan menangani error yang terjadi di Stream
  3. `addRandomNumber()` yang dimodifikasi = trigger untuk mengirim error saat tombol ditekan

  
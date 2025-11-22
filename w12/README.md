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

![GIF](/w12/stream_giovano/img/soal4.gif)

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

## Praktikum 2 W12 Soal 6
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![GIF](/w12/stream_giovano/img/soal6.gif)

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



## Praktikum 2 W12 Soal 7

![GIF](/w12/stream_giovano/img/soal7.gif)

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



## Praktikum 3 W12 Soal 8

![GIF](/w12/stream_giovano/img/soal8.gif)

- Jelaskan maksud kode langkah 1 sampai 3 tersebut!

  **Jawaban:**

  **Langkah 1 - Deklarasi `StreamTransformer`:**
  ```dart
  late StreamTransformer<int, int> transformer;
  ```
  
  Mendeklarasikan variabel `transformer` dengan tipe `StreamTransformer<int, int>`. StreamTransformer adalah sebuah class yang digunakan untuk **memodifikasi atau mentransformasi data** yang mengalir melalui Stream. Generic `<int, int>` menunjukkan bahwa transformer ini menerima input berupa `int` dan menghasilkan output berupa `int`.

  **Langkah 2 - Inisialisasi `StreamTransformer` dengan handlers:**
  ```dart
  transformer = StreamTransformer<int, int>.fromHandlers(
    handleData: (value, sink) {
      sink.add(value*10);
    },
    handleError: (error, stackTrace, sink) {
      sink.add(-1);
    },
    handleDone: (sink) => sink.close(),
  );
  ```
  
  Membuat instance `StreamTransformer` dengan mendefinisikan tiga handler:
  
  - **`handleData`**: Handler untuk memproses data normal yang masuk
    - Menerima `value` (data asli) dan `sink` (output channel)
    - `sink.add(value*10)` mengalikan nilai yang masuk dengan 10 sebelum dikirim ke listener
    - Contoh: jika nilai asli 5, yang diterima listener adalah 50
  
  - **`handleError`**: Handler untuk memproses error yang terjadi di Stream
    - Menerima `error`, `stackTrace`, dan `sink`
    - `sink.add(-1)` mengubah error menjadi nilai -1 dan mengirimnya sebagai data normal
    - Ini mengkonversi error menjadi data, mencegah error merusak aliran Stream
  
  - **`handleDone`**: Handler yang dipanggil ketika Stream selesai
    - `sink.close()` menutup output sink ketika Stream selesai

  **Langkah 3 - Menerapkan transformer ke Stream:**
  ```dart
  numberStream.stream.transform(transformer).listen((eventNumber) {
  ```
  
  Menerapkan transformer ke Stream menggunakan method `.transform()`:
  - `numberStream.stream` adalah Stream asli
  - `.transform(transformer)` menerapkan transformasi yang sudah didefinisikan
  - Data yang mengalir melalui Stream akan diproses oleh transformer sebelum sampai ke listener
  - `.listen()` tetap digunakan untuk mendengarkan hasil transformasi

  **Kesimpulan:**
  StreamTransformer berfungsi sebagai **middleware** atau **filter** yang berada di antara Stream producer dan consumer. Dalam kasus ini, transformer mengalikan setiap angka dengan 10 dan mengubah error menjadi nilai -1, sehingga listener selalu menerima data yang sudah dimodifikasi.



## Praktikum 4 W12 Soal 9

![GIF](/w12/stream_giovano/img/soal9.gif)

![GIF](/w12/stream_giovano/img/soal9img.png)

- Jelaskan maksud kode langkah 2, 6, dan 8 tersebut!

  **Jawaban:**

  **Langkah 2 - Modifikasi `initState()` untuk menggunakan `StreamSubscription`:**
  ```dart
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    subscription = stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
    subscription.onError((error){
      setState(() {
        lastNumber = -1;
      });
    });
    subscription.onDone(() {
      print("OnDone was called");
    });
    super.initState();
  }
  ```
  
  Method `initState()` dimodifikasi untuk menggunakan **StreamSubscription** yang memberikan kontrol lebih detail terhadap Stream listener:
  
  - `numberStreamController = numberStream.controller` menyimpan reference ke StreamController untuk akses langsung
  - `Stream stream = numberStreamController.stream` mendapatkan Stream dari controller
  - `subscription = stream.listen()` membuat subscription dan menyimpannya di variabel `subscription` (tipe `StreamSubscription`)
  - `subscription.onError()` mendaftarkan error handler yang akan dipanggil saat ada error, mengubah `lastNumber` menjadi -1
  - `subscription.onDone()` mendaftarkan callback yang dipanggil ketika Stream selesai/ditutup, mencetak pesan "OnDone was called"
  
  **Keuntungan menggunakan StreamSubscription:**
  - Dapat di-cancel secara eksplisit dengan `subscription.cancel()`
  - Dapat di-pause dan resume dengan `subscription.pause()` dan `subscription.resume()`
  - Memberikan kontrol lifecycle yang lebih baik terhadap listener

  **Langkah 6 - Method `stopStream()` untuk membatalkan subscription:**
  ```dart
  subscription.cancel();
  ```
  
  Method ini membatalkan subscription ke Stream dengan memanggil `subscription.cancel()`:
  - Menghentikan listener dari menerima event lebih lanjut dari Stream
  - Membebaskan resource yang digunakan oleh subscription
  - Setelah di-cancel, subscription tidak dapat digunakan lagi dan harus dibuat subscription baru jika ingin listen lagi
  - Ini adalah **best practice** untuk mencegah memory leak, terutama saat widget di-dispose

  **Langkah 8 - Modifikasi `addRandomNumber()` dengan validasi stream:**
  ```dart
  void addRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(randomNumber);
    }else{
      setState(() {
        lastNumber = -1;
      });
    }
  }
  ```
  
  Method ini ditambahkan validasi untuk mengecek status StreamController:
  - `!numberStreamController.isClosed` mengecek apakah StreamController masih terbuka (belum di-close)
  - **Jika masih terbuka**: mengirim angka random ke Stream seperti biasa
  - **Jika sudah tertutup**: mengubah `lastNumber` menjadi -1 sebagai indikator bahwa Stream sudah tidak aktif
  - Validasi ini mencegah error yang terjadi jika mencoba mengirim data ke Stream yang sudah di-close

  **Kesimpulan:**
  Ketiga langkah ini mendemonstrasikan **lifecycle management** dari Stream dan Subscription:
  1. **Langkah 2**: Setup subscription dengan handler lengkap (onData, onError, onDone)
  2. **Langkah 6**: Membersihkan resource dengan cancel subscription
  3. **Langkah 8**: Validasi state Stream sebelum mengirim data untuk menghindari error

  
## Praktikum 5 W12 Soal 10
- Jelaskan mengapa error bisa terjadi

  **Jawaban:**

  Error **"Bad state: Stream has already been listened to"** terjadi karena kode ini:

  ```dart
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });
    subscription2 = stream.listen((event) {  // ❌ ERROR DI SINI
      setState(() {
        values += '$event - ';
      });
    });
    super.initState();
  }
  ```

  **Penyebab Error:**

  Secara default, `StreamController` membuat **single-subscription stream**, yang artinya:
  - Stream hanya bisa di-listen oleh **SATU listener** saja
  - Ketika `subscription = stream.listen()` dipanggil pertama kali, Stream sudah "diklaim" oleh listener pertama
  - Saat mencoba memanggil `subscription2 = stream.listen()` yang kedua kalinya, Stream menolak karena sudah memiliki listener
  - Ini adalah mekanisme proteksi untuk mencegah data broadcast yang tidak diinginkan

  **Solusi:**

  Ada dua cara untuk mengatasi error ini:

  **1. Menggunakan Broadcast Stream:**
  ```dart
  final controller = StreamController<int>.broadcast();
  ```
  Broadcast stream memungkinkan **multiple listeners** mendengarkan Stream yang sama secara bersamaan.

  **2. Menggunakan Single Listener saja:**
  Hapus salah satu subscription dan hanya gunakan satu listener:
  ```dart
  subscription = stream.listen((event) {
    setState(() {
      values += '$event - ';
    });
  });
  // Hapus subscription2
  ```

  **Analogi:**
  Bayangkan Stream seperti telepon:
  - **Single-subscription stream** = telepon biasa, hanya 1 orang yang bisa menerima panggilan
  - **Broadcast stream** = conference call, banyak orang bisa mendengar sekaligus


  
## Praktikum 5 W12 Soal 11

![GIF](/w12/stream_giovano/img/soal11.gif)

- Jelaskan mengapa hal itu bisa terjadi ?

  **Jawaban:**

  Dari screenshot terlihat bahwa setiap angka muncul **dua kali** (contoh: "5 - 5 -", "3 - 3 -"). Hal ini terjadi karena ada **dua subscription** yang mendengarkan Stream yang sama:

  ```dart
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream.asBroadcastStream();
    
    subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';  // Listener pertama menambahkan angka
      });
    });
    
    subscription2 = stream.listen((event) {
      setState(() {
        values += '$event - ';  // Listener kedua menambahkan angka yang sama
      });
    });
    super.initState();
  }
  ```

  **Penjelasan Alur:**

  1. **Broadcast Stream dibuat** dengan `.asBroadcastStream()` yang memungkinkan multiple listeners
  2. **subscription** (listener pertama) di-setup untuk mendengarkan Stream
  3. **subscription2** (listener kedua) juga di-setup untuk mendengarkan Stream yang sama
  4. Ketika tombol "Add Random Number" ditekan, angka dikirim ke Stream
  5. **Kedua listener menerima event yang sama secara bersamaan**
  6. Masing-masing listener menjalankan `setState()` dan menambahkan `'$event - '` ke variabel `values`
  7. **Hasilnya**: setiap angka muncul dua kali di UI

  **Contoh Flow:**
  - User tekan tombol → angka 5 dikirim ke Stream
  - subscription (listener 1) menerima 5 → `values += '5 - '` → values = "5 - "
  - subscription2 (listener 2) menerima 5 → `values += '5 - '` → values = "5 - 5 - "

  **Kesimpulan:**
  Setiap angka muncul dua kali karena ada dua listener yang sama-sama mendengarkan dan merespons event yang sama dari Broadcast Stream. Jika ingin angka hanya muncul satu kali, hapus salah satu subscription (subscription atau subscription2).

  ## Praktikum 6 W12 Soal 12

![GIF](/w12/streambuilder_giovano/img/soal12.gif)

- Jelaskan maksud kode langkah 3 dan 7 tersebut!

### Penjelasan Langkah 3: Class NumberStream

```dart
import 'dart:async';
import 'dart:math';

class NumberStream {
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNumber = random.nextInt(100);
      return myNumber;
    });
  }
}
```

**Penjelasan:**
- `NumberStream` adalah class yang berfungsi untuk membuat stream angka random.
- Method `getNumbers()` mengembalikan `Stream<int>` menggunakan generator asynchronous (`async*`).
- `Stream.periodic()` membuat stream yang memancarkan nilai secara periodik setiap 1 detik.
- Setiap detik, fungsi callback menghasilkan angka random antara 0-99 menggunakan `Random().nextInt(100)`.
- `yield*` digunakan untuk meneruskan semua nilai dari stream yang dihasilkan oleh `Stream.periodic()`.

### Penjelasan Langkah 7: StreamBuilder Widget

```dart
body: StreamBuilder(
  stream: numberStream,
  initialData: 0,
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      print('Error!');
    }
    if (snapshot.hasData) {
      return Center(
        child: Text(snapshot.data.toString(),
          style: const TextStyle(fontSize: 96),
        ),
      );
    }else{
      return const SizedBox.shrink();
    }
  },
),
```

**Penjelasan:**
- `StreamBuilder` adalah widget yang membangun UI berdasarkan snapshot terbaru dari stream.
- `stream: numberStream` - mendengarkan stream dari `NumberStream` yang telah dibuat.
- `initialData: 0` - memberikan nilai awal 0 sebelum data pertama dari stream diterima.
- `builder` - fungsi callback yang dipanggil setiap kali ada data baru dari stream.
- `snapshot.hasError` - mengecek apakah ada error dalam stream dan mencetak pesan error.
- `snapshot.hasData` - mengecek apakah snapshot memiliki data, jika ya menampilkan angka dengan font size 96 di tengah layar.
- Jika tidak ada data, mengembalikan `SizedBox.shrink()` (widget kosong).


## Praktikum 7 W12 Soal 13

![GIF](/w12/bloc_random_gio/img/soal13.gif)

- Jelaskan maksud praktikum ini ! Dimanakah letak konsep pola BLoC-nya ?

### Penjelasan Praktikum

Praktikum ini bertujuan untuk mengimplementasikan pola arsitektur **BLoC (Business Logic Component)** dalam aplikasi Flutter untuk mengelola state dan aliran data secara reaktif. Aplikasi ini merupakan aplikasi sederhana yang menampilkan angka random (0-9) setiap kali tombol refresh ditekan.

### Konsep Pola BLoC dalam Praktikum Ini

Letak konsep pola BLoC dapat ditemukan di file **`random_bloc.dart`** dan implementasinya di **`random_screen.dart`**:

#### 1. **File `random_bloc.dart` - Business Logic Layer**
   - **Input Stream Controller**: `_generateRandomController` - menerima event/trigger untuk generate angka random
   - **Output Stream Controller**: `_randomNumberController` - mengirimkan hasil angka random ke UI
   - **Sink (Input)**: `generateRandom` - sebagai "pintu masuk" untuk menerima event dari UI
   - **Stream (Output)**: `randomNumber` - sebagai "pintu keluar" untuk mengirim data ke UI
   - **Logic Processing**: Di dalam constructor, terdapat listener yang memproses event input dan menghasilkan angka random (0-9), kemudian mengirimkannya ke output stream
   - **Dispose Method**: Membersihkan resources dengan menutup semua stream controller

#### 2. **File `random_screen.dart` - Presentation Layer**
   - **BLoC Instance**: `final RandomNumberBloc _bloc = RandomNumberBloc()` - membuat instance BLoC
   - **StreamBuilder Widget**: Mendengarkan perubahan dari stream `_bloc.randomNumber` dan rebuild UI secara otomatis ketika ada data baru
   - **Event Trigger**: `_bloc.generateRandom.add(null)` - mengirim event ke BLoC melalui sink ketika tombol ditekan
   - **Lifecycle Management**: Method `dispose()` dipanggil untuk membersihkan BLoC ketika widget dihapus

### Alur Kerja Pola BLoC:
```
User Action (Tekan Tombol) 
    ↓
Sink Input (_generateRandomController.sink)
    ↓
Business Logic (Generate Random Number)
    ↓
Stream Output (_randomNumberController.stream)
    ↓
StreamBuilder (Rebuild UI)
    ↓
Tampilan Angka Random di Layar
```

### Keuntungan Pola BLoC:
- **Separation of Concerns**: Logika bisnis terpisah dari UI
- **Reaktif**: UI otomatis update ketika ada perubahan data
- **Testable**: Business logic mudah di-test secara terpisah
- **Reusable**: BLoC dapat digunakan di berbagai widget

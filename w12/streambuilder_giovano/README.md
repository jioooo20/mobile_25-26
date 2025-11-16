## Praktikum 6 W12 Soal 12

![GIF]('/img/soal12.gif')

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
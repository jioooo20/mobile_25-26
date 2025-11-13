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

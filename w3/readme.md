# Laporan Praktikum PEMROGRAMAN MOBILE

| Nama      | NIM      | Kelas      | Mata Kuliah | Semester |
|-----------|----------|------------|-------------|----------|
| Giovano Alkandri | 2341720096| TI-2C| PEMROGRAMAN MOBILE    | 5        |

## 2. Praktikum 1: Menerapkan Control Flows ("if/else")
Ketik atau salin kode program berikut ke dalam fungsi main().
### LANGKAH 1:
~~~Dart
String test = "test2";
if (test == "test1") {
   print("Test1");
} else If (test == "test2") {
   print("Test2");
} Else {
   print("Something else");
}

if (test == "test2") print("Test2 again");
~~~

### Langkah 2:
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan!

>Hasil Run

![Image](/w3/img/image.png)

### Langkah 3:
Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

~~~Dart
String test = "true";
if (test) {
   print("Kebenaran");
}
~~~

Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan if/else.

>Hasil error karena variable test telah digunakan, maka variabel dapat diubah menjadi 'test2', lalu pada pengkondisian if seharusnya dirubah menjadi 'test == "true"'. Hasil di bawah ini

![Image](/w3/img/image2.png)


## 3. Praktikum 2: Menerapkan Perulangan "while" dan "do-while"
### langkah 1:

Ketik atau salin kode program berikut ke dalam fungsi main().

~~~Dart
while (counter < 33) {
  print(counter);
  counter++;
}
~~~

### Langkah 2:
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

>Terjadi error karena counter belum dideklarasi, maka dapat ditambahkan dulu. 'int counter = 17;'. berikut adalah hasil dijalankan

![Image](/w3/img/image3.png)

### Langkah 3:

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

~~~Dart
do {
  print(counter);
  counter++;
} while (counter < 77);
~~~

Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan do-while.

>Hasil run
![Image](/w3/img/image4.png)

## 4. Praktikum 3: Menerapkan Perulangan "for" dan "break-continue"

### Langkah 1:
Ketik atau salin kode program berikut ke dalam fungsi main().

~~~Dart
for (Index = 10; index < 27; index) {
  print(Index);
}
~~~

### Langkah 2:
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

>terjadi error karena tipe data belum ditentukan pada variable index. tambahkan int di depan index dan ++ pada index paling kanan agar tidak looping abadi. hasil run di bawah ini


![Image](/w3/img/image5.png)

### Langkah 3:
Tambahkan kode program berikut di dalam for-loop, lalu coba eksekusi (Run) kode Anda.
~~~dart
    if (index == 21)
      break;
    else if (index > 1 || index < 7)
      continue;
    print(index);
~~~

>ubah logika or menjadi and agar looping dapat tampil angka index

![Image](/w3/img/image6.png)

## 5. Tugas Praktikum

Buatlah sebuah program yang dapat menampilkan bilangan prima dari angka 0 sampai 201 menggunakan Dart. Ketika bilangan prima ditemukan, maka tampilkan nama lengkap dan NIM Anda.

~~~Dart
void main(List<String> args) {
  int angka = 0;
  while (angka <=201){
    bool isPrima = true;
    if (angka < 2) {
      isPrima = false;
    } else {
      for (int i = 2; i <= angka ~/ 2; i++) {
      if (angka % i == 0) {
        isPrima = false;
        break;
      }
      }
    }
    if (isPrima) {
      print("$angka \nNIM: 2341720096 \nNama: Giovano Alkandri");
    }else if (!isPrima){
      print("$angka");
    }
    angka++;
  }
}
~~~

>Hasil Run

![Image](/w3/img/image7.png)


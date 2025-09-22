# Laporan Praktikum PEMROGRAMAN MOBILE

| Nama      | NIM      | Kelas      | Mata Kuliah | Semester |
|-----------|----------|------------|-------------|----------|
| Giovano Alkandri | 2341720096| TI-3H| PEMROGRAMAN MOBILE    | 5        |

## Praktikum 1: Eksperimen Tipe Data List

### Langkah 1:

Ketik atau salin kode program berikut ke dalam void main().

```dart
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);

  ```

  ### Langkah 2:

  Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan!

![Image](/w4/img/image1.png)
![Image](/w4/img/image2.png)

>assert digunakan untuk memastikan suatu kondisi bernilai true selama pengembangan dan debugging. dari kode diatas pada cek length bernilai benar, namun jika salah akan mengembalikan error. lalu pada list[1] yang seharusnya adalah '2' telah diganti menjadi '1' sehingga assert tidak mengembalikan error

### Langkah 3:

Ubah kode pada langkah 1 menjadi variabel final yang mempunyai index = 5 dengan default value = null. Isilah nama dan NIM Anda pada elemen index ke-1 dan ke-2. Lalu print dan capture hasilnya.

Apa yang terjadi ? Jika terjadi error, silakan perbaiki.

```dart
  var list = ['Gio', 2341720096,3, 4, null];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);
  ```

  >program error karena assert pertama dan kedua tidak sesuai. berikut adalah kode yang benar

  ```dart
    var list = ['Gio', 2341720096,3, 4, null];
  assert(list.length == 5);
  assert(list[1] == 2341720096);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);
  ```
  ![Image](/w4/img/image3.png)


## Praktikum 2: Eksperimen Tipe Data Set

### Langkah 1:

Ketik atau salin kode program berikut ke dalam fungsi main().

```dart
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
print(halogens);
```

### Langkah 2:

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

![Image](/w4/img/image4.png)

>program berjalan dengan baik tanpa ada kendala

### Langkah 3:

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
var names1 = <String>{};
Set<String> names2 = {}; // This works, too.
var names3 = {}; // Creates a map, not a set.

print(names1);
print(names2);
print(names3);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan ketiga variabel tersebut. Tambahkan elemen nama dan NIM Anda pada kedua variabel Set tersebut dengan dua fungsi berbeda yaitu .add() dan .addAll(). Untuk variabel Map dihapus, nanti kita coba di praktikum selanjutnya.

![Image](/w4/img/image5.png)

>berhasil dijalankan tanpa terjadi error. di bawah ini kode dann hasil setelah ditambahkan nama dan nim menggunakan add dan addAll

```dart
  name1.add('Gio');
  name2.addAll({'2', '3', '4', '1', '7', '2', '0', '0', '9', '6'});
```

![Image](/w4/img/image6.png)

> hasil dari fngsi add() berjalan normal. tetapi pada fungsi addAll() ternyata tidak bisa menambahkan string yang sama lebih dari 1x, jadi yang masuk ke dalam set hanya yang unik saja


## Praktikum 3: Eksperimen Tipe Data Maps

### Langkah 1:

Ketik atau salin kode program berikut ke dalam fungsi main().

```dart
main() {
  var gifts = {
  //key: value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2
  };
  
print(gifts);
print(nobleGases);

}
```

### Langkah 2:

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

>berhasil dijalankan tanpa terjadi error

![Image](/w4/img/image7.png)

### Langkah 3:

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
var mhs1 = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var mhs2 = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki.

Tambahkan elemen nama dan NIM Anda pada tiap variabel di atas (gifts, nobleGases, mhs1, dan mhs2). Dokumentasikan hasilnya dan buat laporannya!

>berikut adalah kode seteah ditambahkan nama dan nim

```dart
var mhs1 = Map<String, String>();
mhs1['first'] = 'gio';
mhs1['second'] = '2341720096';
gifts['first'] = 'golden ring';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var mhs2 = Map<int, String>();
mhs2[1] = 'gio';
mhs2[2] = '2341720096';
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';

print(mhs1);
print(mhs2);
print(gifts);
print(nobleGases);
```

>hasil run kode

![Image](/w4/img/image8.png)

## Praktikum 4: Eksperimen Tipe Data List: Spread dan Control-flow Operators

### Langkah 1:

Ketik atau salin kode program berikut ke dalam fungsi main().

```dart
var list = [1, 2, 3];
var list2 = [0, ...list];
print(list1);
print(list2);
print(list2.length);
```

### Langkah 2:

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

> '...list' titik 3 di depan list digunakan untuk memasukkan value dari variable list

>hasil run kode

![Image](/w4/img/image9.png)

### Langkah 3:

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
list1 = [1, 2, null];
print(list1);
var list3 = [0, ...?list1];
print(list3.length);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki.

>terjadi error karena list1 tidak menggunakan var, jadi perlu ditambahkan var terlebih dahulu

Tambahkan variabel list berisi NIM Anda menggunakan Spread Operators. Dokumentasikan hasilnya dan buat laporannya!

>berikut adalah kode yang sudah benar

```dart
var list1 = [1, 2, null];
print(list1);

var list3 = [0, ...?list1];
print(list3.length);

var nim = [2,3,4,1,7,2,0,0,9,6];
var nama_nim = ['gio', ...nim];
print(nama_nim);
```

>hasil run kode

![Image](/w4/img/image10.png)

### Langkah 4:

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
print(nav);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Tunjukkan hasilnya jika variabel promoActive ketika true dan false.

>terjadi error pada variable promoActive. berikut adlaah kode yang benar

```dart
var promoActive = true; 
// var promoActive = false; 
var nav = ['home', 'furniture', 'plants', if (promoActive) 'outlet'];
print(nav);
```

>hasil run ketika promoActive true

![Image](/w4/img/image11.png)

>hasil run ketika promoActive false

![Image](/w4/img/image12.png)

### Langkah 5:

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
print(nav2);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Tunjukkan hasilnya jika variabel login mempunyai kondisi lain.

>terjaid error karena login belum diinisialisasi, berikut adalah kode yang sudah benar, serta jika login memiliki kondisi lain

```dart
var login = 'Manager';
// var login = 'pegawai';
var nav2 = ['home', 'furniture', 'plants', if (login case 'Manager') 'inventory'];
print(nav2);
```

>login manager

![Image](/w4/img/image13.png)

>login selain manager

![Image](/w4/img/image14.png)

### Langkah 6:

Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');
print(listOfStrings);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Jelaskan manfaat Collection For dan dokumentasikan hasilnya.

![Image](/w4/img/image15.png)

>manfaat dari collection for sendiri tergantung dari kondisi yang akan digunakan. pada kasus di atas iterasi akan dimuali pada posisi tertentu, bukan dari index ke 0

## Praktikum 5: Eksperimen Tipe Data Records

### Langkah 1:

Ketik atau salin kode program berikut ke dalam fungsi main().

```dart
var record = ('first', a: 2, b: true, 'last');
print(record)
```

### Langkah 2:

Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

>kode berhasil dijalankan

![Image](/w4/img/image16.png)

### Langkah 3:

Tambahkan kode program berikut di luar scope void main(), lalu coba eksekusi (Run) kode Anda.

```dart
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Gunakan fungsi tukar() di dalam main() sehingga tampak jelas proses pertukaran value field di dalam Records.

> tidak terjaid perubahan. berikut adalah kode yang sudah benar

```dart
void main(List<String> args) {
  var record = ('first', a:2, b: true, 'last');
  print(record);
  print(tukar((1, 2)));
}

(int, int) tukar((int, int)record){
  var (a, b) = record;
  return (b, a);
}
```

>hasil kode dijalankan

![Image](/w4/img/image17.png)

>dari fungsi tukar tadi, posisi dari variable a dan b telah ditukar posisinya sehingga mengahasilka output seperti di atas

### Langkah 4:

Tambahkan kode program berikut di dalam scope void main(), lalu coba eksekusi (Run) kode Anda.

```dart
// Record type annotation in a variable declaration:
(String, int) mahasiswa;
print(mahasiswa);
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Inisialisasi field nama dan NIM Anda pada variabel record mahasiswa di atas. Dokumentasikan hasilnya dan buat laporannya!

>terjadi error, berikut adalah kode yang benar

```dart
(String, int) mhs;
mhs = ('gio', 23);
print(mhs);
```

>hasil run kode

![Image](/w4/img/image18.png)

### Langkah 5:

Tambahkan kode program berikut di dalam scope void main(), lalu coba eksekusi (Run) kode Anda.

```dart
var mahasiswa2 = ('first', a: 2, b: true, 'last');

print(mahasiswa2.$1); // Prints 'first'
print(mahasiswa2.a); // Prints 2
print(mahasiswa2.b); // Prints true
print(mahasiswa2.$2); // Prints 'last'
```

Apa yang terjadi ? Jika terjadi error, silakan perbaiki. Gantilah salah satu isi record dengan nama dan NIM Anda, lalu dokumentasikan hasilnya dan buat laporannya!

>kode berhasil dijalankan, berikut adalah kode yang sudah dibenarkan

![Image](/w4/img/image19.png)

## Tugas Praktikum

1. Silakan selesaikan Praktikum 1 sampai 5, lalu dokumentasikan berupa screenshot hasil pekerjaan Anda beserta penjelasannya!
2. Jelaskan yang dimaksud Functions dalam bahasa Dart!

  >function adalah sekumpulan kode yang dikelompokkan berdasarkan fungsinya masing"

3. Jelaskan jenis-jenis parameter di Functions beserta contoh sintaksnya!

  >pada function memiliki beberapa jenis parameter. yang pertama adalah parameter wajib (String name, int age), parameter tersebut wajib diisi. ke dua parameter opsional (String name, [int age = 23]), yang berada dalam kurung siku '[]' boleh tidak diisi dan dapaat punya default value. ke tiga named parameter ({required String name, int age = 23}), saat memanggil fungsi harus menyertakan parameter nya, contohnya "mhs(name: 'gio', age: 23);". ke empat parameter dengan fungsi/lambda (callback) (hitung(int a, int b, int Function(int,int) operasi)), di dalam parameter tersebut akan digunakannya fungsi lain

4. Jelaskan maksud Functions sebagai first-class objects beserta contoh sintaknya!

  >first class objek merupakan fungsi yang bisa diperlakukan sbg nilai biasa, disimpan, dikirim, dan dkiembalikan. contoh nya koed di bawah ini

  ```dart
    void sapa(String nama) {
      print('halo $nama');
    }

    void main() {
      var fungsiSapa = sapa; // simpan function di variabel
      fungsiSapa('gio');    // panggil lewat variabel
    }
  ```

5. Apa itu Anonymous Functions? Jelaskan dan berikan contohnya!

  >anonymous function aadalah fungsi tanpa nama yang digunakan untuk operasi singkat atau sekali pakai. contohnya adalah di bawah ini

  ```dart
    var kali = (int x, int y) => x * y;
    print(kali(4, 5)); // output: 20
  ```

6. Jelaskan perbedaan Lexical scope dan Lexical closures! Berikan contohnya!

  >lexical scope yaitu menentukan akses variabel berdasarkan lokasi penulisan kode, sedangkan lexical closure yaitu fungsi yang menyimpan variable dari scope tmpat didefinisikan walau dipanggil di tempat lain.

  >contoh lexical scope
  ```dart
  void main() {
  var x = 10;

  void tampil() {
    print(x);
  }

  tampil(); // output: 10
  print(x); // output: 10
  }
  ```

  >contoh lexical closure
  ```dart
  Function buatCounter() {
  int count = 0;

  return () {
    count++;
    print('Hitung: $count');
  };
  }

  void main() {
    var counter1 = buatCounter();
    counter1(); // Hitung: 1
    counter1(); // Hitung: 2

    var counter2 = buatCounter();
    counter2(); // Hitung: 1 
  }
  ```

7. Jelaskan dengan contoh cara membuat return multiple value di Functions!

  >berikut adalah contoh kode untuk mereturn multiple value di function
  ```dart
  Map<String, dynamic> getData() {
  return {'umur': 23, 'nama': 'gio'};
  }

  void main() {
    var hasil = getData();
    print('nama: ${hasil['nama']}, umur: ${hasil['umur']}');
  }
  ```
  
  >hasil kode dijalankan
  ![Image](/w4/img/image20.png)
# Laporan Praktikum PEMROGRAMAN MOBILE

| Nama      | NIM      | Kelas      | Mata Kuliah | Semester |
|-----------|----------|------------|-------------|----------|
| Giovano Alkandri | 2341720096| TI-3H| PEMROGRAMAN MOBILE    | 5        |


## Praktikum 1
![GIF](/w10/master_plan/img/p1.gif)
2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?
    > file tersebut digunakan sebagai penampung export, file ini mengumpulkan semua export dari model" data dalam satu tempat. alasannya untuk menyederhanakan import dan clean code.
3. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?
    > variabel plan diperlukan sebagai state untuk menyimpan data planning yang akan ditampilkan di plan_screen. perlu dibuat konstanta karena hanya untuk inisialisasi awal dengan plan kosongan dan bisa diubah ubah nilainya dengan setState()
5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
    > initState() digunakan sebagai method yang dipanggil sekali saat pertama kali widget dibuat. fungsi nya membuat instanve ScrollController yang mengontrol scroll dan setiap kali discroll keybaord akan otomatis menutup

    > dispose() dignakan ketika widget sudah tidak digunakan lagi. fungisnya untuk membersihkan memori yang digunakan ScrollController


## Praktikum 2
![GIF](/w10/master_plan/img/p2.gif)
2. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?
    >class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> 

    > Efisiensi rebuild: hanya widget yang memanggil dependOnInheritedWidgetOfExactType/... akan rebuild saat notifier berubah. 
    > Ringan dan terintegrasi: built-in Flutter, tanpa dependency eksternal.
    > Cocok untuk state yang berbentuk Listenable (ChangeNotifier, ValueNotifier, AnimationController).

3. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?
    > int get completedCount digunakan untuk menghitung jumlah task yang selesai berdasarkan centang.
    > completenessMessage menghitung jumlah task yang ada

    > hal ini dilakukan karena sudah auto update ketika menggunakan getter, jadi setiap task ditambah atau task selesai akan otomatis terupdate.


## Praktikum 3
![GIF](/w10/master_plan/img/p3.gif)
2. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
![Image](/w10/master_plan/img/tp3num2.png)

> Diagram ini menunjukkan transformasi struktur widget hierarchy setelah melakukan navigasi (Navigator.push) dalam aplikasi Flutter.
> Sisi Kiri (Before): Menampilkan struktur awal dengan MaterialApp - PlanProvider - PlanCreatorScreen yang berisi Column dengan child TextField dan Expanded (yang memuat ListView).
> Sisi Kanan (After): Menunjukkan struktur setelah push navigasi, di mana PlanCreatorScreen digantikan oleh PlanScreen. Struktur baru memiliki Scaffold dengan Column yang berisi Expanded (berisi ListView) dan SafeArea (berisi Text).
> Makna: Diagram ini mengilustrasikan bagaimana Navigator.push dalam Flutter menumpuk (push) screen baru ke navigation stack, sehingga widget tree berubah struktur dan layout-nya. Perubahan ini mencerminkan perbedaan antara layar input plan dan layar tampilan plan dengan komponen UI yang berbeda sesuai dengan kebutuhan masing-masing screen.



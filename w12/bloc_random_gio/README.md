## Praktikum 7 W12 Soal 13

![GIF]('/img/soal13.gif')

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
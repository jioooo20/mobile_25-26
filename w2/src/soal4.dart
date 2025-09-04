// Penjelasan:
// Null Safety adalah fitur Dart yang memastikan variabel tidak bisa bernilai null kecuali diizinkan secara eksplisit.
// Dengan Null Safety, variabel bertipe non-nullable harus diinisialisasi sebelum digunakan.
// Kata kunci 'late' digunakan untuk menunda inisialisasi variabel non-nullable sampai nanti, 
// tetapi tetap menjamin variabel tidak null saat diakses.

void nullSafety() {
  int a = 10; 
  int? b;    
  print('a: $a');
  print('b: $b');
}

void lateVariable() {
  late int c; 
  c = 20;     
  print('c: $c');
}

void main() {
  nullSafety();
  lateVariable();
}
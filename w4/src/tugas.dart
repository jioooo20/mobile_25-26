// void sapa(String nama) {
//   print('halo $nama');
// }

// void main() {
//   var fungsiSapa = sapa;
//   fungsiSapa('gio');
// }

////////
// void main(List<String> args) {
//   var kali = (int x, int y) => x * y;
//   print(kali(4, 5)); // output: 20
// }

/////////
// void main() {
//   var x = 10;

//   void tampil() {
//     print(x);
//   }

//   tampil(); // output: 10
//   print(x); // output: 10
// }

////////////
// Function buatCounter() {
//   int count = 0;

//   return () {
//     count++;
//     print('Hitung: $count');
//   };
// }

// void main() {
//   var counter1 = buatCounter();
//   counter1(); // Hitung: 1
//   counter1(); // Hitung: 2

//   var counter2 = buatCounter();
//   counter2(); // Hitung: 1
// }

Map<String, dynamic> getData() {
  return {'umur': 23, 'nama': 'gio'};
}

void main() {
  var hasil = getData();
  print('nama: ${hasil['nama']}, umur: ${hasil['umur']}');
}


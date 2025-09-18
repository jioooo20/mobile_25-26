void main(List<String> args) {
  // var list = [1, 2, 3];
  // var list2 = [0, ...list];
  // print(list);
  // print(list2);
  // print(list2.length);

  // var list1 = [1, 2, null];
  // print(list1);

  // var list3 = [0, ...?list1];
  // print(list3.length);

  // var nim = [2,3,4,1,7,2,0,0,9,6];
  // var nama_nim = ['gio', ...nim];
  // print(nama_nim);

  // // var promoActive = true; 
  // var promoActive = false; 
  // var nav = ['home', 'furniture', 'plants', if (promoActive) 'outlet'];
  // print(nav);

  // var login = 'Manager';
  // var login = 'pegawai';
  // var nav2 = ['home', 'furniture', 'plants', if (login case 'Manager') 'inventory'];
  // print(nav2);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for(var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
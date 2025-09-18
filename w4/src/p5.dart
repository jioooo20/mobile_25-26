void main(List<String> args) {
  var record = ('first', a: 2, b: true, 'last');
  print(record);
  print(tukar((1, 2)));

  //rec type anotation in a var declaration
  (String, int) mhs;
  mhs = ('gio', 23);
  print(mhs);

  var mhs2 = ('gioo', a: 2341720096, b: true, 'last');

  print(mhs2.$1); // 'gioo'
  print(mhs2.a); // 2341720096
  print(mhs2.b); // true
  print(mhs2.$2); // 'last'
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

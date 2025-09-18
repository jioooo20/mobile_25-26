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

}

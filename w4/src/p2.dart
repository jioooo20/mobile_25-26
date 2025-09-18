void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var name1 = <String>{};
  Set<String> name2 = {};   // This works, too.
  // var name3 = {};          // Creates a map, not a set.

  name1.add('Gio');
  name2.addAll({'2', '3', '4', '1', '7', '2', '0', '0', '9', '6'});

  print(name1);  
  print(name2);  
  // print(name3);  
  
}

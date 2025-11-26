class Pizza {
  static const keyId = 'id';
  static const keyName = 'pizzaName';
  static const keydescription = 'description';
  static const keyprice = 'price';
  static const keyimageUrl = 'imageUrl';
  
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;
  
  Pizza.fromJson(Map<String, dynamic> json)
    : id = json[keyId] is int ? json[keyId] : (int.tryParse(json[keyId].toString()) ?? 0),
      pizzaName = json[keyName] != '' ? json[keyName].toString() : 'No Name',
      description = json[keydescription] != null ? json[keydescription].toString() : '',
      price = json[keyprice] is double ? json[keyprice] : (double.tryParse(json[keyprice].toString()) ?? 0),
      imageUrl = json[keyimageUrl] ?? '';
  Map<String, dynamic> toJson() => {
    keyId: id,
    keyName: pizzaName,
    keydescription: description,
    keyprice: price,
    keyimageUrl: imageUrl,
  };
}

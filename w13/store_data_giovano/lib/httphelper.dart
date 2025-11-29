import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './model/pizza.dart';

class HttpHelper {
  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }
  final String authority = '5l1g3.wiremockapi.cloud';
  final String path = '/pizzalist';
  Future<List<Pizza>> getPizzaList() async {
    try {
      final Uri url = Uri.https(authority, path);
      final http.Response result = await http.get(url);
      if (result.statusCode == HttpStatus.ok) {
        // Check if response is valid JSON
        if (result.body.startsWith('<') || result.body.contains('<script')) {
          print('Error: Received HTML instead of JSON');
          return [];
        }
        final jsonResponse = json.decode(result.body);
        List<Pizza> pizzas = jsonResponse
            .map<Pizza>((i) => Pizza.fromJson(i))
            .toList();
        return pizzas;
      } else {
        print('Error: Status code ${result.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching pizzas: $e');
      return [];
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza';
    String post = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, postPath);
    http.Response r = await http.post(url, body: post);
    return r.body;
  }

  Future<String> putPizza(Pizza pizza) async {
    const putPath = '/pizza';
    String put = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, putPath);
    http.Response r = await http.put(url, body: put);
    return r.body;
  }

  Future<String> deletePizza(int id) async {
  const deletePath = '/pizza';
  Uri url = Uri.https(authority, deletePath);
  http.Response r = await http.delete(
    url,
  );
  return r.body;
}
}

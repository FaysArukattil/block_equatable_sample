import 'dart:convert';

import 'package:block_equatable_sample/models/respproducts.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiService {
  final baseurl = "https://dummyjson.com";
  Logger logger = Logger();
  Future<List<Products>?> loadproducts() async {
    Uri url = Uri.parse("$baseurl/products");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        logger.i(response.body);

        var json = jsonDecode(response.body);
        var res = Respproducts.fromJson(json);
        return res.products;
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }
}

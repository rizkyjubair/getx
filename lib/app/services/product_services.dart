import 'dart:convert';
import 'package:getx/app/modules/product/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  final String apiUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
    } else {
      throw Exception('Failed to load product');
    }
  }
}

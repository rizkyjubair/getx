import 'package:get/get.dart';
import 'package:getx/app/modules/product/models/product_model.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    products.addAll([
      ProductModel(name: 'Product 1', price: 29.99),
      ProductModel(name: 'Product 2', price: 59.99),
      ProductModel(name: 'Product 3', price: 79.99),
    ]);
    super.onInit();
  }
}

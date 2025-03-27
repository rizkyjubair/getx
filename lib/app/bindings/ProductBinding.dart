import 'package:get/get.dart';
import 'package:getx/app/modules/product/controllers/cart_controller.dart';
import 'package:getx/app/modules/product/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut<CartController>(() => CartController());
  }
}

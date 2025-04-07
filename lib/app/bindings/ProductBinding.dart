import 'package:get/get.dart';
import 'package:getx/app/modules/product/controllers/product_controller.dart';
import 'package:getx/app/services/product_services.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductServices>(() => ProductServices());
    Get.lazyPut<ProductController>(
      () => ProductController(productServices: Get.find<ProductServices>()),
    );
  }
}

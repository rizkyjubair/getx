import 'package:get/get.dart';
import 'package:getx/app/modules/product/models/product_model.dart';
import 'package:getx/app/services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var errorMessage = ''.obs;
  var isLoading = true.obs;

  final ProductServices productServices;

  ProductController({required this.productServices});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      var products = await productServices.fetchProducts();
      productList.addAll(products);
    } catch (e) {
      errorMessage('Failed to fetch product');
    } finally {
      isLoading(false);
    }
  }
}

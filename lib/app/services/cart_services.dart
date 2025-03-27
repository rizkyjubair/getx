import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/app/modules/product/models/product_model.dart';

class CartService extends GetxService {
  final storage = GetStorage();
  var cartItems = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    List? storageCart = storage.read<List>('cartItems');
    if (storageCart != null) {
      cartItems.assignAll(
        storageCart.map((e) => ProductModel.fromJson(e)).toList(),
      );
    }
    ever(cartItems, (_) {
      storage.write('cartItems', cartItems.map((e) => e.toJson()).toList());
    });
  }

  void addToCart(ProductModel product) {
    cartItems.add(product);
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  void clearCart() {
    cartItems.clear();
  }

  double get totalAmout {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/product/controllers/cart_controller.dart';
import 'package:getx/app/modules/product/models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;
    final CartController cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart');
              // Get.off(() => CartView(), arguments: product);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.title, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('\$${product.price}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);
                Get.snackbar(
                  'Added to Cart',
                  '${product.title} added to your cart',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              child: Text('Add to Cart'),
            ),
            ElevatedButton(
              child: Text('More action'),
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.shopping_cart),
                          title: Text('View cart'),
                          onTap: () {
                            Get.toNamed('/cart');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.payment),
                          title: Text('Proceed to checkout'),
                          onTap: () {
                            Get.toNamed('/checkout');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/product/controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (productController.errorMessage.isNotEmpty) {
          return Center(child: Text(productController.errorMessage.value));
        }
        return ListView.builder(
          itemCount: productController.productList.length,
          itemBuilder: (content, index) {
            final product = productController.productList[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text('\$${product.price.toString()}'),
              onTap: () {
                Get.toNamed('/product-details', arguments: product);
                // Get.to(() => ProductDetailsView(), arguments: product);
                // Get.off(ProductDetailsView(), arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}

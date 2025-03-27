import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/product/controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toString()}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Remove Item',
                          middleText:
                              'Are you sure want to remove ${item.name} from the cart?',
                          textConfirm: 'Yes',
                          textCancel: 'No',
                          confirmTextColor: Colors.white,
                          onConfirm: () {
                            cartController.removeFromCart(item);
                            Get.back();
                          },
                          onCancel: () {},
                        );
                      },
                    ),
                  );
                },
              );
            }),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total : ${cartController.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/checkout');
            },
            child: Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}

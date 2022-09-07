import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/cart_controller.dart';
import 'package:getx_example/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = controller.products[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name: ${product.productName}'),
                              Text(
                                  'Description: ${product.productDescription}'),
                              Text('Price: ${product.price.toString()}')
                            ],
                          ),
                          ElevatedButton(
                            child: const Text('Add'),
                            onPressed: () {
                              cartController.addToCart(product);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          GetX<CartController>(builder: (cartController) {
            return Text('Total amount: \$ ${cartController.totalPrice}');
          }),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:getx_example/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productsResult = [
      Product(
        id: 1,
        productName: 'Product 1',
        productDescription: 'Description 1',
        productImage: 'abd',
        price: 10,
      ),
      Product(
        id: 2,
        productName: 'Product 2',
        productDescription: 'Description 2',
        productImage: 'abd',
        price: 20,
      ),
      Product(
        id: 3,
        productName: 'Product 3',
        productDescription: 'Description 3',
        productImage: 'abd',
        price: 30,
      ),
    ];

    products.value = productsResult;
  }
}

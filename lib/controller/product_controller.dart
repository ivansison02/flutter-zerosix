import 'package:zerosix/models/product.dart';
import 'package:zerosix/utils/factory.dart';
import 'package:zerosix/utils/global.dart';

class ProductController {

  List<Product> getProducts() => Global.products;

  void manageProduct(Product product, int quantity) {
    List<Product> cacheProducts = getProducts();

    // Check list if no product has been added yet.
    if (cacheProducts.length == 0) {
      product.quantity = 1;
      cacheProducts.add(product);
    }
    /* Check list if selected product is:
         1. Existing in the list
         2. Not yet existing
    */
    else {
      bool hasItem = false;

      for (Product savedProduct in cacheProducts) {
        if (product.key == savedProduct.key) hasItem = true;
      }

      if (!hasItem) {
        product.quantity = 1;
        cacheProducts.add(product);
      }
      else {
        product.quantity += quantity;

        if (product.quantity == 0) cacheProducts.remove(product);
        else if (product.quantity == 11) product.quantity = 10;
      }
    }
  }

  void manageStock() {
    for (Product product in Factory.getAllProducts()) {
      for (Product selectedProduct in getProducts()) {
        if (product.key == selectedProduct.key) {
          int newQty = product.quantity - selectedProduct.quantity;

          print('Product: ${product.name} | OLD QTY: ${product.quantity} | NEW QTY: $newQty');

          product.quantity = newQty;
        }
      }
    }
  }

  void addProduct(Product product) {
    getProducts().add(product);
  }

  void updProduct(Product product) {

  }
}
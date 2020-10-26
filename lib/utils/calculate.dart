import 'package:zerosix/models/product.dart';

class Calculate {

  static double getTotalPrice(List<Product> products) {
    double total = 0.0;

    for (Product product in products) {
      total += product.price * product.quantity;
    }

    return total;
  }

  static int getTotalQty(List<Product> products) {
    int total = 0;

    for (Product product in products) {
      total += product.quantity;
    }

    return total;
  }
}
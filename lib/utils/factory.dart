import 'package:zerosix/controller/user_controller.dart';
import 'package:zerosix/models/store.dart';
import 'package:zerosix/models/product.dart';
import 'package:zerosix/models/user.dart';

class Factory {
  static List<Product> getAllProducts() {
    List<Product> allProducts = [];

    allProducts.addAll(Factory.getProducts(0, 0));
    allProducts.addAll(Factory.getProducts(1, 2));
    allProducts.addAll(Factory.getProducts(2, 4));

    return allProducts;
  }

  static List<Product> getProducts(int index, int storeKey) {
    if (index == 0)
      return [
        Product(key: 0, storeKey: storeKey, name: 'ROG STRIX B360-F GAMING INTEL ATX', description: 'Asus Gaming Motherboard', photo: '', price: 3200.0, quantity: 19),
        Product(key: 1, storeKey: storeKey, name: 'ROG STRIX B360-I GAMING INTEL ATX', description: 'Asus Gaming Motherboard', photo: '', price: 7200.0, quantity: 21),
        Product(key: 2, storeKey: storeKey, name: 'ROG STRIX GLADIUS II', description: 'Gaming Mouse', photo: '', price: 4500.0, quantity: 6),
        Product(key: 3, storeKey: storeKey, name: 'ROG STRIX CLAYMORE', description: 'Gaming Keyboard Full', photo: '', price: 9900.0, quantity: 7)
      ];
    else if (index == 1)
      return [
        Product(key: 4, storeKey: storeKey, name: 'Logitech G240', description: 'Gaming Mousepad', photo: '', price: 3200.0, quantity: 4),
        Product(key: 5, storeKey: storeKey, name: 'Logitech G402 Hyperion Fury', description: 'Gaming Mouse', photo: '', price: 3500.0, quantity: 6),
        Product(key: 6, storeKey: storeKey, name: 'Logitech C930e', description: 'Business Web Cam', photo: '', price: 7000.0, quantity: 6),
        Product(key: 7, storeKey: storeKey, name: 'Logitech C920', description: 'Web Cam 15mp HD Pro', photo: '', price: 4500.0, quantity: 6),
        Product(key: 8, storeKey: storeKey, name: 'Logitech G431', description: 'Gaming Headset', photo: '', price: 3090.0, quantity: 6),
        Product(key: 9, storeKey: storeKey, name: 'Logitech G331', description: 'Gaming Headset', photo: '', price: 2030.0, quantity: 6)
      ];
    else
      return [
        Product(key: 10, storeKey: storeKey, name: 'ROG STRIX B360-F GAMING INTEL ATX', description: 'Asus Gaming Motherboard', photo: '', price: 3200.0, quantity: 19),
        Product(key: 11, storeKey: storeKey, name: 'ROG STRIX B360-I GAMING INTEL ATX', description: 'Asus Gaming Motherboard', photo: '', price: 7200.0, quantity: 21),
        Product(key: 12, storeKey: storeKey, name: 'ROG STRIX GLADIUS II', description: 'Gaming Mouse', photo: '', price: 12200.0, quantity: 6)
      ];
  }

  static List<Store> getStores() {
    return [
      Store(key: 0, name: 'ASUS', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', photo: '', opensAt: '10:30 AM', closesAt: '7:00 PM', products: getProducts(0, 0)),
      Store(key: 1, name: 'MSI', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', photo: '', opensAt: '10:30 AM', closesAt: '7:00 PM', products: List()),
      Store(key: 2, name: 'ACER', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', photo: '', opensAt: '10:30 AM', closesAt: '7:00 PM', products: getProducts(2, 2)),
      Store(key: 3, name: 'SAMSUNG', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', photo: '', opensAt: '11:00 AM', closesAt: '8:00 PM', products: List()),
      Store(key: 4, name: 'LOGITECH', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', photo: '', opensAt: '1:00 PM', closesAt: '9:00 PM', products: getProducts(1, 4)),
    ];
  }

  static User getAdmin() => User(username: 'admin', password: '123456', photo: '', userType: UserController.TYPE_ADMIN, isLoggedIn: false);
  static User getUser() => User(username: 'user_customer', password: '123456', photo: '', userType: UserController.TYPE_USER, isLoggedIn: false);
}
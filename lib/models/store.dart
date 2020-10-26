import 'package:zerosix/models/product.dart';

class Store {
  int key;
  String name;
  String description;
  String photo;
  String opensAt;
  String closesAt;
  List<Product> products;

  Store({this.key, this.name, this.description, this.photo, this.opensAt, this.closesAt, this.products});
}
import 'package:zerosix/models/product.dart';
import 'package:zerosix/models/store.dart';

class ProductArgs {

  Store store;
  Product selectedProduct;

  ProductArgs({this.store, this.selectedProduct});
}
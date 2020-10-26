import 'package:zerosix/models/product.dart';
import 'package:zerosix/models/store.dart';

class StoreArgs {

  Store store;
  List<Product> products;

  StoreArgs({this.store, this.products});
}
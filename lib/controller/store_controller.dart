import 'package:zerosix/models/store.dart';
import 'package:zerosix/utils/global.dart';

class StoreController {

  List<Store> getStores() => Global.stores;

  void addStore(Store store) {
    getStores().add(store);
  }

  void updateStore(Store store) {

  }
}
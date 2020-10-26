import 'package:zerosix/models/store.dart';
import 'package:zerosix/utils/global.dart';

class StoreController {

  List<Store> getStores() => Global.stores;

  void addStore(Store store) {
    getStores().add(store);
  }

  void updStore(Store store) {
    for (Store savedStore in getStores()) {
      if (savedStore.key == store.key)
        savedStore = store;
    }
  }

  void removeStore(Store store) {
    getStores().remove(store);
  }
}
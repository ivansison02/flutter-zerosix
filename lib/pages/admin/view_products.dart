import 'package:flutter/material.dart';
import 'package:zerosix/arguments/product_args.dart';
import 'package:zerosix/arguments/store_args.dart';
import 'package:zerosix/models/product.dart';
import 'package:zerosix/models/store.dart';
import 'package:zerosix/pages/admin/add_product.dart';
import 'package:zerosix/ui/product_layout.dart';

void main() => runApp(ViewProductsPage());

class ViewProductsPage extends StatefulWidget {
  static const routeName = '/view_prods';

  ViewProductsPage({Key key, this.title = ''}) : super(key: key);

  final String title;
  _ViewProductsPageState pageState;

  @override
  _ViewProductsPageState createState() {
    pageState = _ViewProductsPageState();
    return pageState;
  }

  void removeProduct(Product product) => pageState.removeProduct(product);
}

class _ViewProductsPageState extends State<ViewProductsPage> {

  List<Product> _products = [];

  void removeProduct(Product product) {
    setState(() {
      _products.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    StoreArgs _storeArgs = ModalRoute.of(context).settings.arguments;

    if (_storeArgs != null) {
      _products = _storeArgs.products;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: _products.length > 0?
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
          child: ListView.builder(
            itemBuilder: (context, position) {
              return ProductLayout(
                  productListPage: widget,
                  productArgs: ProductArgs(
                      store: _storeArgs.store,
                      selectedProduct: _products.elementAt(position)
                  )
              );
            },
            itemCount: _products.length,
          ),
        ) : Center(
            child: Text(
                'There is no available product')
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.add
        ),
        backgroundColor: Colors.red[800],
        onPressed: () => Navigator.pushNamed(context, ProductPage.routeAddName, arguments:
          ProductArgs(
            store: _storeArgs.store,
            selectedProduct: null
          )
        ),
      ),
    );
  }
}

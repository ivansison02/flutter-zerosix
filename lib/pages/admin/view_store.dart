import 'package:flutter/material.dart';
import 'package:zerosix/arguments/product_args.dart';
import 'package:zerosix/arguments/store_args.dart';
import 'package:zerosix/models/product.dart';
import 'package:zerosix/models/store.dart';
import 'package:zerosix/pages/admin/add_product.dart';
import 'package:zerosix/pages/admin/add_store.dart';
import 'package:zerosix/pages/admin/view_products.dart';
import 'package:zerosix/ui/product_layout.dart';
import 'package:zerosix/utils/global.dart';

void main() => runApp(ViewStorePage());

class ViewStorePage extends StatelessWidget {
  static const routeName = '/view_store';

  ViewStorePage({Key key, this.title = ''}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Store store = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            store.name
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(icon: Icon(
              Icons.edit
          ),
              onPressed: () => Navigator.pushNamed(context, StorePage.routeUpdName, arguments: store)
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/img_pc.png'
                  ),
                  fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(
              height: 16.0
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Text(store.description),
          ),
          SizedBox(
              height: 5.0
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Text('Operating Hours: ${store.opensAt} - ${store.closesAt}'),
          ),
          SizedBox(
              height: 16.0
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Text('Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
            ),
          ),
          store.products.length > 0? Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
              child: ListView.builder(
                itemBuilder: (context, position) {
                  return ProductLayout(
                    productArgs: ProductArgs(
                        store: store,
                        selectedProduct: store.products.elementAt(position)
                    ),
                  );
                },
                itemCount: store.products.length >= 3? 3: store.products.length,
              ),
            ),
          ) : Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
            child: Text('There is no product'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: RaisedButton(
                color: Colors.red[800],
                textColor: Colors.white,
                child: Text('Manage Products${store.products.length >= 3 ? '(${store.products.length})' : ''}',
                    style: TextStyle(fontSize: 16)
                ),
                onPressed: () => Navigator.pushNamed(context, ViewProductsPage.routeName, arguments:
                  StoreArgs(
                    store: store,
                    products: store.products)
                )
            ),
          )
        ],
      ),
    );
  }
}

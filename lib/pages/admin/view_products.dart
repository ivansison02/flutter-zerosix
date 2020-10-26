import 'package:flutter/material.dart';
import 'package:zerosix/models/product.dart';
import 'package:zerosix/pages/admin/add_product.dart';
import 'package:zerosix/ui/product_layout.dart';

void main() => runApp(ViewProductsPage());

class ViewProductsPage extends StatefulWidget {
  static const routeName = '/view_prods';

  ViewProductsPage({Key key, this.title = ''}) : super(key: key);

  final String title;

  @override
  _ViewProductsPageState createState() => _ViewProductsPageState();
}

class _ViewProductsPageState extends State<ViewProductsPage> {

  List<Product> _products = [];

  @override
  Widget build(BuildContext context) {
    _products = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ProductLayout(product: _products.elementAt(position));
          },
          itemCount: _products.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.add
        ),
        backgroundColor: Colors.red[800],
        onPressed: () => Navigator.pushNamed(context, ProductPage.routeAddName),
      ),
    );
  }
}

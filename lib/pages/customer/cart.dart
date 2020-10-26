import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zerosix/controller/product_controller.dart';
import 'package:zerosix/models/product.dart';
import 'package:zerosix/pages/customer/home_customer.dart';
import 'package:zerosix/ui/cart_layout.dart';
import 'package:zerosix/utils/calculate.dart';
import 'package:zerosix/utils/format.dart';
import 'package:zerosix/utils/global.dart';

void main() => runApp(CartPage());

class CartPage extends StatefulWidget {
  HomeCustomerPage parentPage;
  final String title;

  CartPage({Key key, this.parentPage, this.title = ''}) : super(key: key);

  _CartPageState pageState;

  @override
  _CartPageState createState() {
    pageState = _CartPageState();
    return pageState;
  }

  void updateList() {
    pageState._refreshState();
    parentPage.refreshState();
  }
}

class _CartPageState extends State<CartPage> {

  void _refreshState() => setState(() {});

  void _payClicked() {
    print(Global.products.length);
    if (Global.products.length > 0)
      showDialog(context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Success"),
              content: new Text("Transaction successful!"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ProductController().manageStock();

                      setState(() {
                        Global.products = [];
                      });

                      widget.parentPage.setActivePage(0);
                    },
                    child: Text(
                        'Ok'
                    )
                )
              ],
            );
          });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = Global.products;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Cart'
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, position) => CartLayout(cartPage: widget, product: products.elementAt(position)),
                itemCount: products.length,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'TOTAL:',
                              style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '${Format.getPrice(Calculate.getTotalPrice(products))}',
                             style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: RaisedButton(
                        onPressed: _payClicked,
                        color: Colors.red[800],
                        child: Center(
                          child: Text(
                            'Pay',
                              style: TextStyle(
                                color: Colors.white
                              ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

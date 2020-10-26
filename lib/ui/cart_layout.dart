import 'package:flutter/material.dart';
import 'package:zerosix/controller/product_controller.dart';
import 'package:zerosix/models/product.dart';
import 'package:zerosix/pages/customer/cart.dart';
import 'package:zerosix/utils/format.dart';

class CartLayout extends StatefulWidget {

  CartPage cartPage;
  final Product product;

  CartLayout({this.product, this.cartPage});

  @override
  _CartLayoutState createState() => _CartLayoutState();
}

class _CartLayoutState extends State<CartLayout> {

  void manageQuantity(int quantity) => setState(() {
    ProductController().manageProduct(widget.product, quantity);
    widget.cartPage.updateList();
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image(
                image: AssetImage(
                    'assets/img_pc.png'
                )
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                  child: Text(
                    '${Format.getPrice(widget.product.price)}',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.red[900]
                    ),
                  ),
                ),
                SizedBox(height: 6.0),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 0, 0),
                  child: Text(
                    widget.product.name,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => manageQuantity(-1),
                        child: Container(
                          width: 30,
                          child: Card(
                            color: Colors.grey[300],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  '-'
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: 30,
                          child: Center(
                            child: Text(
                                '${widget.product.quantity}'
                            ),
                          )
                      ),
                      GestureDetector(
                        onTap: () => manageQuantity(1),
                        child: Container(
                          width: 30,
                          child: Card(
                            color: Colors.grey[300],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  '+'
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
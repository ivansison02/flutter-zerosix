import 'package:flutter/material.dart';
import 'package:zerosix/controller/product_controller.dart';
import 'package:zerosix/controller/user_controller.dart';
import 'package:zerosix/models/product.dart';
import 'package:zerosix/pages/admin/add_product.dart';
import 'package:zerosix/pages/customer/home.dart';
import 'package:zerosix/utils/format.dart';
import 'package:zerosix/utils/global.dart';

class ProductLayout extends StatelessWidget {

  HomePage productPage;
  final Product product;

  ProductLayout({this.productPage, this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Global.user.userType == UserController.TYPE_ADMIN) Navigator.pushNamed(context, ProductPage.routeUpdName, arguments: product);
        else {
          ProductController().manageProduct(product, 1);
          productPage.refreshState();
        }
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
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
                      '${Format.getPrice(product.price)}',
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
                      product.name,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                  child: Text(
                    'QTY: ${product.quantity}',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.red[900]
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

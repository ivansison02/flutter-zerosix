import 'package:flutter/material.dart';
import 'package:zerosix/arguments/product_args.dart';
import 'package:zerosix/controller/product_controller.dart';
import 'package:zerosix/controller/user_controller.dart';
import 'package:zerosix/models/product.dart';
import 'package:zerosix/pages/admin/add_product.dart';
import 'package:zerosix/pages/admin/view_products.dart';
import 'package:zerosix/pages/customer/home.dart';
import 'package:zerosix/utils/format.dart';
import 'package:zerosix/utils/global.dart';

class ProductLayout extends StatelessWidget {

  HomePage productPage;
  ViewProductsPage productListPage;

  ProductArgs productArgs;

  ProductLayout({this.productPage, this.productListPage, this.productArgs});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Global.user.userType == UserController.TYPE_ADMIN) Navigator.pushNamed(context, ProductPage.routeUpdName, arguments: productArgs);
        else {
          ProductController().manageProduct(productArgs.selectedProduct, 1);
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
                      '${Format.getPrice(productArgs.selectedProduct.price)}',
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
                      productArgs.selectedProduct.name,
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
                    'QTY: ${productArgs.selectedProduct.quantity}',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.red[900]
                    ),
                  ),
                ),
              ),
            Global.user.userType == UserController.TYPE_ADMIN?
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    productListPage.removeProduct(productArgs.selectedProduct);
                  }),
            ) : Container()
          ],
        ),
      ),
    );
  }
}

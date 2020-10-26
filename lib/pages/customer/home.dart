import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zerosix/arguments/product_args.dart';
import 'package:zerosix/models/product.dart';
import 'package:zerosix/models/store.dart';
import 'package:zerosix/pages/customer/home_customer.dart';
import 'package:zerosix/ui/product_layout.dart';
import 'package:zerosix/ui/store_category_layout.dart';
import 'package:zerosix/utils/factory.dart';
import 'package:zerosix/utils/global.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  _HomePageState pageState;
  HomeCustomerPage parentPage;
  final String title;

  HomePage({Key key, this.parentPage, this.title = ''}) : super(key: key);

  @override
  _HomePageState createState() {
    pageState = _HomePageState();
    return pageState;
  }

  void refreshState() => parentPage.refreshState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void updateBadge() => setState(() => widget.parentPage.refreshState());

  void setActiveCategory(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    List<Store> stores = Global.stores;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Home'
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Container(
              height: 40.0,
              child:
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, position) => StoreCategoryLayout(homePage: widget, store: stores.elementAt(position), isActive: _selectedIndex == position? true : false, position: position),
                itemCount: stores.length,
              ),
            ),
          ),
          stores.elementAt(_selectedIndex).products.length > 0? Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, position) => ProductLayout(
                productPage: widget,
                productArgs: ProductArgs(
                  store: stores.elementAt(_selectedIndex),
                  selectedProduct: stores.elementAt(_selectedIndex).products.elementAt(position),
                )
              ),
              itemCount: stores.elementAt(_selectedIndex).products.length,
            ),
          ) : Text('There is no available product')
        ],
      ),
    );
  }
}

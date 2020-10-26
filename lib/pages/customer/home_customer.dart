import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zerosix/models/user.dart';
import 'package:zerosix/pages/customer/account.dart';
import 'package:zerosix/pages/customer/cart.dart';
import 'package:zerosix/pages/customer/home.dart';
import 'package:zerosix/utils/calculate.dart';
import 'package:zerosix/utils/global.dart';
import 'package:badges/badges.dart';

void main() {
  runApp(HomeCustomerPage());
}

class HomeCustomerPage extends StatefulWidget {
  static const routeName = '/home_customer';

  HomeCustomerPage({Key key, this.title = ''}) : super(key: key);

  final String title;
  _HomeCustomerPageState page;

  @override
  _HomeCustomerPageState createState() {
    page = _HomeCustomerPageState();
    return page;
  }

  void setActivePage(int i) => page._bottomNavigationBarItemClicked(i);

  void refreshState() {page._refreshState();}
}

class _HomeCustomerPageState extends State<HomeCustomerPage> {
  List<Widget> _myPages = <Widget>[];

  int _selectedIndex = 0;

  void _bottomNavigationBarItemClicked(int index) => setState(() => _selectedIndex = index);

  void _refreshState() => setState(() {});

  @override
  void initState() {
    _myPages = [
      HomePage(parentPage: widget),
      CartPage(parentPage: widget),
      AccountPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    Global.user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: _myPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red[800],
        currentIndex: _selectedIndex,
        onTap: _bottomNavigationBarItemClicked,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Badge(
              badgeContent: Text(
                 '${Calculate.getTotalQty(Global.products)}',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              badgeColor: Colors.red[800],
              child: Icon(
                Icons.shopping_cart_rounded,
              )
            ),
            label: 'Cart'
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.account_circle
            ),
            label: 'Account'
          ),
        ],
      ),
    );
  }
}

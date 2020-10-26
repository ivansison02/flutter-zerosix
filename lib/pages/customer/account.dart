import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zerosix/models/store.dart';
import 'package:zerosix/pages/customer/home_customer.dart';
import 'package:zerosix/ui/product_layout.dart';
import 'package:zerosix/ui/store_category_layout.dart';
import 'package:zerosix/utils/factory.dart';
import 'package:zerosix/utils/global.dart';

import '../login.dart';

void main() => runApp(AccountPage());

class AccountPage extends StatefulWidget {
  final String title;

  AccountPage({Key key, this.title = ''}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  void promptLogout(BuildContext context) {
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Notice"),
            content: new Text("Are you sure you want to logout?"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                      'No'
                  )
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (route) => false);
                  },
                  child: Text(
                      'Yes'
                  )
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Account'
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img_gallery.png'),
              maxRadius: 100,
              backgroundColor: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
            child: Text(
              'Username'
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
            child: Text(
                Global.user.username,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Divider(
              height: 30.0,
            ),
          ),
          GestureDetector(
            onTap: () => promptLogout(context),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
              child: Text(
                  'Log out',
                style: TextStyle(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zerosix/models/store.dart';
import 'package:zerosix/pages/admin/add_store.dart';
import 'package:zerosix/pages/login.dart';
import 'package:zerosix/ui/store_layout.dart';
import 'package:zerosix/utils/global.dart';

void main() => runApp(HomeAdminPage());

class HomeAdminPage extends StatefulWidget {
  static const routeName = '/home_admin';

  HomeAdminPage({Key key, this.title = ''}) : super(key: key);

  final String title;

  @override
  _HomeAdminPageState createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
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
                    Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (route) => false);
                  },
                  child: Text(
                      'Yes'
                  )
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                      'No'
                  )
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Global.user = ModalRoute.of(context).settings.arguments;

    List<Store> stores = Global.stores;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(icon: Icon(
              Icons.exit_to_app
               ),
              onPressed: () => promptLogout(context))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, position) => StoreLayout(store: stores.elementAt(position)),
        itemCount: stores.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.add
        ),
        backgroundColor: Colors.red[800],
        onPressed: () => Navigator.pushNamed(context, StorePage.routeAddName),
      ),
    );
  }
}

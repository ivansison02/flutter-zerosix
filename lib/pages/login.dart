import 'package:flutter/material.dart';
import 'package:zerosix/controller/user_controller.dart';
import 'package:zerosix/models/user.dart';
import 'package:zerosix/pages/admin/home_admin.dart';
import 'package:zerosix/pages/customer/home_customer.dart';
import 'package:zerosix/utils/factory.dart';
import 'package:zerosix/utils/global.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {

  static const routeName = '/login';

  final String title;

  LoginPage({Key key, this.title = ''}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _fldUsername = TextEditingController();
  final TextEditingController _fldPassword = TextEditingController();

  bool isPassHidden = true;

  void _toggle() => setState(() {
      if (isPassHidden) isPassHidden = false;
      else isPassHidden = true;
    });

  void _loginClicked(BuildContext context) {
    final String username = _fldUsername.value.text;
    final String password = _fldPassword.value.text;

    if (Factory.getAdmin().username == username &&
        Factory.getAdmin().password == password)
      Navigator.pushReplacementNamed(context, HomeAdminPage.routeName, arguments: User(username: username, userType: UserController.TYPE_ADMIN));
    else if (Factory.getUser().username == username &&
        Factory.getUser().password == password)
      Navigator.pushReplacementNamed(context, HomeCustomerPage.routeName, arguments: User(username: username, userType: UserController.TYPE_USER));
    else {
      showDialog(context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Notice"),
              content: new Text("Invalid credentials."),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      _fldUsername.text = '';
                      _fldPassword.text = '';
                      Navigator.of(context).pop();
                    },
                    child: Text(
                        'Ok'
                    )
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img_login_header.png'
                    ),
                    fit: BoxFit.cover
                ),
              ),
              child: Image(
                image: AssetImage(
                    'assets/img_logo_w_bg.png'
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child:
              TextField(
                controller: _fldUsername,
                decoration: InputDecoration(
                    hintText: 'Username',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey[200]),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[200], width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red[300]),
                    ),
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 0),
              child:
              TextField(
                controller: _fldPassword,
                obscureText: isPassHidden,
                decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[200], width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red[300]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 0),
              child:
              RaisedButton(onPressed: () => _loginClicked(context),
                color: Colors.red[800],
                textColor: Colors.white,
                child: Text('Login',
                    style: TextStyle(fontSize: 16)
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
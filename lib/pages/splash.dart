import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zerosix/utils/factory.dart';
import 'package:zerosix/utils/global.dart';

import 'login.dart';


void main() => runApp(SplashPage());

class SplashPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    Global.stores = Factory.getStores();
    Timer(Duration(seconds: 3),
            ()=> Navigator.pushReplacementNamed(context, LoginPage.routeName)
          );

    return Scaffold(
      backgroundColor: Colors.red[800],
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(image:
                AssetImage(
                  'assets/img_logo.png'
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

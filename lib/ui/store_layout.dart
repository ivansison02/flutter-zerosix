import 'package:flutter/material.dart';
import 'package:zerosix/models/store.dart';
import 'package:zerosix/pages/admin/view_store.dart';

class StoreLayout extends StatelessWidget {

  final Store store;

  StoreLayout({this.store});

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () => Navigator.pushNamed(context, ViewStorePage.routeName, arguments: store),
        child: Card(
          margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image(
                    image: AssetImage(
                        'assets/img_pc.png'
                    )
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        store.name,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.red[800]
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        store.description,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[900]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

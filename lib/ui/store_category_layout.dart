import 'package:flutter/material.dart';
import 'package:zerosix/models/store.dart';
import 'package:zerosix/pages/customer/home.dart';

class StoreCategoryLayout extends StatefulWidget {
  HomePage homePage;
  Store store;
  int position;
  bool isActive = false;

  StoreCategoryLayout({Key key, this.homePage, this.store, this.position, this.isActive}) : super(key: key);

  @override
  _StoreCategoryLayoutState createState() => _StoreCategoryLayoutState();
}

class _StoreCategoryLayoutState extends State<StoreCategoryLayout> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Item(${widget.position}) has been tapped');
        widget.homePage.pageState.setActiveCategory(widget.position);
      },
      child: Card(
        color: widget.isActive? Colors.red[800] : Colors.black54,
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
          child: Center(
            child: Text(
              widget.store.name,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zerosix/controller/store_controller.dart';
import 'package:zerosix/models/store.dart';

void main() => runApp(StorePage());

class StorePage extends StatefulWidget {
  static const routeAddName = '/add_store';
  static const routeUpdName = '/upd_store';

  final String title;

  StorePage({Key key, this.title = ''}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

  final TextEditingController _fldName = TextEditingController();
  final TextEditingController _fldDescription = TextEditingController();
  final TextEditingController _fldOperatingHours = TextEditingController();

  PickedFile _imageFile;

  Future getImage() async {
    PickedFile image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = image;
    });
  }

  void manageStore() {
    if (widget.title.contains('New'))
      StoreController().addStore(
          Store(
              name: _fldName.text, description: _fldDescription.text, operatingHours: _fldOperatingHours.text, products: []
    ));
    else {
      StoreController().updateStore(
          Store(
              name: _fldName.text, description: _fldDescription.text, operatingHours: _fldOperatingHours.text, products: []
          ));
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Store store = ModalRoute.of(context).settings.arguments;

    if (store != null) {
      _fldName.text = store.name;
      _fldDescription.text = store.description;
      _fldOperatingHours.text = store.operatingHours;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => getImage(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              child: CircleAvatar(
                backgroundImage: _imageFile == null? AssetImage('assets/img_gallery.png') : FileImage(File(_imageFile.path)),
                maxRadius: 100,
                backgroundColor: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            child:
            TextField(
              controller: _fldName,
              decoration: InputDecoration(
                  hintText: 'Name'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            child:
            TextField(
              controller: _fldDescription,
              decoration: InputDecoration(
                  hintText: 'Description'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            child:
            TextField(
              controller: _fldOperatingHours,
              decoration: InputDecoration(
                  hintText: 'Operating Hours'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0),
            child:
            RaisedButton(onPressed: () => manageStore(),
              color: Colors.red[800],
              textColor: Colors.white,
              child: Text('Add',
                  style: TextStyle(fontSize: 16)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
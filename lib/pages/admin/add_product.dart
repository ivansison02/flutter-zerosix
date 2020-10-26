import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zerosix/models/product.dart';

void main() => runApp(ProductPage());

class ProductPage extends StatefulWidget {
  static const routeAddName = '/add_prod';
  static const routeUpdName = '/upd_prod';

  final String title;

  ProductPage({Key key, this.title = ''}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final TextEditingController _fldName = TextEditingController();
  final TextEditingController _fldDescription = TextEditingController();
  final TextEditingController _fldPrice = TextEditingController();
  final TextEditingController _fldQty = TextEditingController();

  PickedFile _imageFile;

  Future getImage() async {
    PickedFile image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;

    if (product != null) {
      _fldName.text = product.name;
      _fldDescription.text = product.description;
      _fldPrice.text = '${product.price}';
      _fldQty.text = '${product.quantity}';
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
                  hintText: 'Name',
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
              controller: _fldPrice,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Price'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            child:
            TextField(
              controller: _fldQty,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Available Quantity',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0),
            child:
            RaisedButton(onPressed: () => Navigator.pop(context),
              color: Colors.red[800],
              textColor: Colors.white,
              child: product == null? Text('Add', style: TextStyle(fontSize: 16)): Text('Save', style: TextStyle(fontSize: 16)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
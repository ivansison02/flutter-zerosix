import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zerosix/arguments/product_args.dart';
import 'package:zerosix/arguments/store_args.dart';
import 'package:zerosix/controller/product_controller.dart';
import 'package:zerosix/models/product.dart';
import 'package:zerosix/utils/validator.dart';

void main() => runApp(ProductPage());

class ProductPage extends StatefulWidget {
  static const routeAddName = '/add_prod';
  static const routeUpdName = '/upd_prod';

  final String title;
  int position;

  ProductPage({Key key, this.title = '', this.position}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final TextEditingController _fldName = TextEditingController();
  final TextEditingController _fldDescription = TextEditingController();
  final TextEditingController _fldPrice = TextEditingController();
  final TextEditingController _fldQty = TextEditingController();

  PickedFile _imageFile;
  bool _hasSet = false;
  ProductArgs _productArgs;

  Future getImage() async {
    PickedFile image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = image;
    });
  }

  void manageProduct() {
    if (Validator.isValidName(_fldName.text) &&
        Validator.isValidDescription(_fldDescription.text) &&
        Validator.isValidQty(_fldQty.text) &&
        Validator.isValidPrice(_fldPrice.text)) {
      if (widget.title.contains('New'))
        ProductController().addProduct(
            Product(
                name: _fldName.text, storeKey: _productArgs.store.key, description: _fldDescription.text, price: double.parse(_fldPrice.text), quantity: int.parse(_fldQty.text)
            ));
      else {
        ProductController().updProduct(
            Product(
                name: _fldName.text, storeKey: _productArgs.store.key, description: _fldDescription.text, price: double.parse(_fldPrice.text), quantity: int.parse(_fldQty.text)
            ));
      }

      Navigator.pop(context);
    }
    else showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Notice"),
            content: new Text("Fill all the fields."),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                      'Ok'
                  )
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasSet) {
      _productArgs = ModalRoute.of(context).settings.arguments;

      if (_productArgs != null && _productArgs.selectedProduct != null) {
        _fldName.text = _productArgs.selectedProduct.name;
        _fldDescription.text = _productArgs.selectedProduct.description;
        _fldPrice.text = '${_productArgs.selectedProduct.price}';
        _fldQty.text = '${_productArgs.selectedProduct.quantity}';
        _hasSet = true;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
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
              padding: EdgeInsets.fromLTRB(30.0,30.0, 30.0, 0),
              child:
              TextField(
                controller: _fldName,
                decoration: InputDecoration(
                    hintText: 'Name',
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
                controller: _fldDescription,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Description',
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
                controller: _fldPrice,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Price',
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
                controller: _fldQty,
                maxLength: 2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Available Quantity',
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
              padding: EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 16.0),
              child:
              RaisedButton(onPressed: () => manageProduct(),
                color: Colors.red[800],
                textColor: Colors.white,
                child: _productArgs.selectedProduct == null?
                  Text('Add', style: TextStyle(fontSize: 16)):
                  Text('Save', style: TextStyle(fontSize: 16)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zerosix/controller/store_controller.dart';
import 'package:zerosix/models/store.dart';
import 'package:zerosix/pages/admin/home_admin.dart';
import 'package:zerosix/pages/admin/view_store.dart';
import 'package:zerosix/utils/format.dart';
import 'package:zerosix/utils/validator.dart';

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
  final TextEditingController _fldOpensAt = TextEditingController();
  final TextEditingController _fldClosesAt = TextEditingController();

  PickedFile _imageFile;
  TimeOfDay _selectedTime;
  bool _hasSet = false;

  Future getImage() async {
    PickedFile image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = image;
    });
  }

  Future<Function> _selectTime(BuildContext context, TextEditingController field) async {
    final TimeOfDay timePicked = await showTimePicker(
      context: context,
      initialTime: field.text.isEmpty? TimeOfDay.now() : Format.getTimeOfDay(field.text),
    );
    if (timePicked != null)
      setState(() {
        _selectedTime = timePicked;
        field.text = '${_selectedTime.format(context)}';
      });
  }

  void manageStore() {
    if (Validator.isValidName(_fldName.text) &&
        Validator.isValidDescription(_fldDescription.text) &&
        Validator.isValidTime(_fldOpensAt.text) &&
        Validator.isValidTime(_fldClosesAt.text)) {
      if (widget.title.contains('New')) {
        StoreController().addStore(
            Store(
                name: _fldName.text,
                description: _fldDescription.text,
                opensAt: '${_fldOpensAt.text}',
                closesAt: '${_fldClosesAt.text}',
                products: []
            ));

        Navigator.pop(context);
      }
      else {
        StoreController().updStore(
            Store(
                name: _fldName.text, description: _fldDescription.text,opensAt: '${_fldOpensAt.text}', closesAt: '${_fldClosesAt.text}', products: []
            ));

        Navigator.pop(context);
      }
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
      Store store = ModalRoute.of(context).settings.arguments;

      if (store != null) {
        _fldName.text = store.name;
        _fldDescription.text = store.description;
        _fldOpensAt.text = store.opensAt;
        _fldClosesAt.text = store.closesAt;
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
              padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 16.0, 8.0, 0),
                    child:
                    TextField(
                      controller: _fldOpensAt,
                      keyboardType: TextInputType.datetime,
                      onTap: () {
                        _selectTime(context, _fldOpensAt);
                      },
                      decoration: InputDecoration(
                        hintText: 'Opens At',
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
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 16.0, 30.0, 0),
                    child:
                    TextField(
                      controller: _fldClosesAt,
                      keyboardType: TextInputType.datetime,
                      onTap: () {
                        _selectTime(context, _fldClosesAt);
                      },
                      decoration: InputDecoration(
                        hintText: 'Closes At',
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
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 16.0),
              child:
              RaisedButton(onPressed: () => manageStore(),
                color: Colors.red[800],
                textColor: Colors.white,
                child: widget.title.contains('New')?
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
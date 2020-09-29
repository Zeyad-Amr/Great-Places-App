import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_apps/Widgets.dart/image_input.dart';
import 'package:great_apps/Widgets.dart/location_input.dart';
import 'package:great_apps/providers/greatPlaces.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  var _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add A New Place',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Title',
                              border: InputBorder.none,
                            ),
                            cursorColor: Colors.amber,
                            controller: _titleController,
                          ),
                        ),
                      ),
                      ImageInput(_selectImage),
                      LocationInput(),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Center(
                          child: Container(
                            width: size.width * 0.6,
                            child: FlatButton(
                              padding: EdgeInsets.all(size.height * 0.02),
                              splashColor: Colors.grey,
                              onPressed: () {
                                _savePlace();
                              },
                              child: Text(
                                'Add Place',
                                style: TextStyle(
                                    color: Colors.amber, fontSize: 20),
                              ),
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ));
  }
}

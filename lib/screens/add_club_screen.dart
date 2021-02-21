import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../config.dart';

class AddClubScreen extends StatefulWidget {
  static const routeName = '/add-club';
  @override
  _AddClubScreenState createState() => _AddClubScreenState();
}

class _AddClubScreenState extends State<AddClubScreen> {
  final _key = GlobalKey<FormState>();
  final _clubNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final picker = ImagePicker();

  File _image;
  bool _isPrivate = true;
  String _selectedActivity = "Camping";

  final List<DropdownMenuItem<String>> _activities = [
    DropdownMenuItem(value: "Camping", child: Text("Camping")),
    DropdownMenuItem(value: "Trekking", child: Text("Trekking")),
    DropdownMenuItem(value: "Hunting", child: Text("Hunting")),
    DropdownMenuItem(value: "Water Diving", child: Text("Water Diving")),
    DropdownMenuItem(value: "Other", child: Text("Other..")),
  ];

  final _formContent = {};
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile.path != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Create Club',
                      style: TextStyle(fontSize: 50),
                    ),
                    SizedBox(height: 10),
                    Text(
                        'Please fill the following form to create your community..'),
                    SizedBox(height: 10),
                    _buildImageploader(),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _clubNameController,
                      validator: (value) => value.length >= 5
                          ? null
                          : 'Please enter a valid club name.',
                      decoration: _buildInputDecoration('Club name', null),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      minLines: 3,
                      maxLines: 10,
                      controller: _descriptionController,
                      validator: (value) => value.length >= 5
                          ? null
                          : 'Please enter a valid club descirption.',
                      decoration: _buildInputDecoration(
                          'Write a short description of your club, its activities and purpose.',
                          null),
                    ),
                    SizedBox(height: 10),
                    _buildDropdownButtonFormField(
                        _activities, _selectedActivity, "Main Activity"),
                    SizedBox(height: 10),
                    Text("Privacy : "),
                    SizedBox(height: 10),
                    _buildPrivacyButtons(),
                  ],
                ),
                RaisedButton(
                  color: lightBlueColor,
                  textColor: primColor,
                  child: Text("Create Club"),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell _buildImageploader() {
    return InkWell(
      onTap: () async {
        getImage();
      },
      child: Container(
        height: 150,
        child: _image == null
            ? Icon(
                Icons.add_a_photo,
                size: 100,
              )
            : Image.file(
                _image,
                fit: BoxFit.fitHeight,
              ),
      ),
    );
  }

  DropdownButtonFormField<String> _buildDropdownButtonFormField(
      List items, String value, String label) {
    return DropdownButtonFormField(
        value: value,
        onSaved: (val) {
          setState(() {
            _selectedActivity = val;
          });
        },
        decoration: _buildInputDecoration(label, null),
        onChanged: (val) {
          setState(() {
            value = val;
          });
        },
        items: items);
  }

  Row _buildPrivacyButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          textColor: _isPrivate ? greyColor : primColor,
          color: _isPrivate ? yellowColor : lightBlueColor,
          onPressed: () {
            setState(() {
              _isPrivate = true;
            });
          },
          child: Text('Private'),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              _isPrivate = false;
            });
          },
          color: !_isPrivate ? yellowColor : lightBlueColor,
          textColor: !_isPrivate ? greyColor : primColor,
          child: Text('Public'),
        )
      ],
    );
  }
}

InputDecoration _buildInputDecoration(String hint, IconData icon) {
  return InputDecoration(
    labelText: hint,
    prefixIcon: icon == null ? null : Icon(icon),
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    // fillColor: Colors.cyan,
    border: new OutlineInputBorder(
      borderSide: new BorderSide(color: primColor),
    ),
  );
}

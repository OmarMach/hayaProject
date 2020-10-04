import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haya/config.dart';
import 'package:image_picker/image_picker.dart';

class AddEventScreen extends StatefulWidget {
  static const routeName = '/add-event';
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _key = GlobalKey<FormState>();

  bool _oneDayEvent = true;
  int _formStep = 0;

  String _selectedCategory = "Camping";
  String _selectedRegion = "Benzart";
  String _selectedPlace = "Ain Damous";

  final _startDayController = TextEditingController();
  final _endDayController = TextEditingController();

  final List<DropdownMenuItem<String>> _categories = [
    DropdownMenuItem(value: "Camping", child: Text("Camping")),
    DropdownMenuItem(value: "Trekking", child: Text("Trekking")),
    DropdownMenuItem(value: "Hunting", child: Text("Hunting")),
    DropdownMenuItem(value: "Water Diving", child: Text("Water Diving")),
  ];

  final List<DropdownMenuItem<String>> _regions = [
    DropdownMenuItem(value: "Nabeul", child: Text("Nabeul")),
    DropdownMenuItem(value: "Benzart", child: Text("Benzart")),
    DropdownMenuItem(value: "Jendouba", child: Text("Jendouba")),
    DropdownMenuItem(value: "Beja", child: Text("Beja")),
  ];

  final List<DropdownMenuItem<String>> _places = [
    DropdownMenuItem(value: "Cap serat", child: Text("Cap serat")),
    DropdownMenuItem(value: "Cap hmem", child: Text("Cap hmem")),
    DropdownMenuItem(value: "Cap angela", child: Text("Cap angela")),
    DropdownMenuItem(value: "Ain Damous", child: Text("Ain Damous")),
  ];

  File _image;
  final picker = ImagePicker();

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
  void dispose() {
    _startDayController.dispose();
    _endDayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildFormStepNavigation(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create event..",
                    style: TextStyle(fontSize: 50),
                  ),
                  Text("Please fill in the event details.."),
                  SizedBox(height: 20),
                  if (_formStep == 0) ...[
                    _buildImageploader(),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (value) => value.length >= 5
                          ? null
                          : 'Please enter a valid event name.',
                      decoration: _buildInputDecoration('Event name', null),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      minLines: 3,
                      maxLines: 10,
                      validator: (value) => value.length >= 5
                          ? null
                          : 'Please enter a valid event descirption.',
                      decoration:
                          _buildInputDecoration('Event description', null),
                    ),
                  ],
                  if (_formStep == 1) ...[
                    SizedBox(height: 10),
                    _buildDropdownButtonFormField(
                        _categories, _selectedCategory, "Category"),
                    SizedBox(height: 10),
                    _buildDateRow(context),
                    SizedBox(height: 10),
                    _buildCheckBoxRow(),
                  ],
                  if (_formStep == 2) ...[
                    SizedBox(height: 10),
                    _buildDropdownButtonFormField(
                        _regions, _selectedRegion, "Region"),
                    SizedBox(height: 10),
                    _buildDropdownButtonFormField(
                        _places, _selectedPlace, "Place"),
                    SizedBox(height: 10),
                    RaisedButton(
                      onPressed: () {},
                      color: backgroundColor,
                      child: Text("Create event"),
                      textColor: primColor,
                    )
                  ],
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildDateRow(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: _buildDatePickerTextField(context, _startDayController,
              _oneDayEvent ? 'Date' : 'Start day'),
        ),
        if (_oneDayEvent == false) SizedBox(width: 10),
        if (_oneDayEvent == false)
          Flexible(
            child: _buildDatePickerTextField(
                context, _endDayController, 'End day'),
          ),
      ],
    );
  }

  Row _buildFormStepNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: Material(
            color: _formStep == 0 ? Colors.grey.withAlpha(70) : backgroundColor,
            child: InkWell(
              splashColor: lighterprimColor,
              child: SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.arrow_back,
                  color: _formStep == 0 ? Colors.grey : lighterprimColor,
                ),
              ),
              onTap: _formStep == 0
                  ? null
                  : () {
                      setState(() {
                        _formStep--;
                      });
                    },
            ),
          ),
        ),
        ClipOval(
          child: Material(
            color: _formStep == 2 ? Colors.grey.withAlpha(70) : backgroundColor,
            child: InkWell(
              splashColor: lighterprimColor,
              child: SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.arrow_forward,
                  color: _formStep == 2 ? Colors.grey : lighterprimColor,
                ),
              ),
              onTap: _formStep == 2
                  ? null
                  : () {
                      setState(() {
                        _formStep++;
                      });
                    },
            ),
          ),
        )
      ],
    );
  }

  InkWell _buildImageploader() {
    return InkWell(
      onTap: () async {
        getImage();
      },
      child: Container(
        height: 250,
        child: _image == null
            ? Icon(
                Icons.add_a_photo,
                size: 100,
              )
            : Image.file(
                _image,
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  DropdownButtonFormField<String> _buildDropdownButtonFormField(
      List items, String value, String label) {
    return DropdownButtonFormField(
        value: value,
        decoration: _buildInputDecoration(label, null),
        onChanged: (val) {
          setState(() {
            value = val;
          });
        },
        items: items);
  }

  InkWell _buildDatePickerTextField(
      BuildContext context, TextEditingController controller, String label) {
    return InkWell(
      onTap: () async {
        final seletectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2021),
        );
        controller.text =
            "${seletectedDate.day}/${seletectedDate.month}/${seletectedDate.year}";
      },
      child: IgnorePointer(
        child: new TextFormField(
          controller: controller,
          decoration: _buildInputDecoration(label, Icons.event),
          validator: (value) {
            return value.isEmpty ? "Please select a date" : null;
          },
        ),
      ),
    );
  }

  Row _buildCheckBoxRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Checkbox(
          activeColor: backgroundColor,
          value: _oneDayEvent,
          onChanged: (bool value) {
            setState(() {
              _oneDayEvent = value;
            });
          },
        ),
        InkWell(
          onTap: () {
            setState(() {
              _oneDayEvent = !_oneDayEvent;
            });
          },
          child: Text('One day event'),
        ),
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

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
  // TODO : Validation with each step / Swipe between steps if that step is successful / preview event
  // TOFIX : saving dropdown menu items.

  final _key = GlobalKey<FormState>();

  final _startDayController = TextEditingController();
  final _endDayController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formContent = {};

  bool _oneDayEvent = false;
  bool _isPrivate = false;
  int _formStep = 0;

  String _stepText = "General informations";
  String _selectedCategory = "Camping";
  String _selectedRegion = "Benzart";
  String _selectedPlace = "Ain Damous";

  var _friendList = [
    {
      "name": "Jhon doe",
      "active": false,
    },
    {
      "name": "Omar Mach",
      "active": false,
    },
    {
      "name": "Jackson Teller",
      "active": false,
    },
    {
      "name": "Gemma Morrow",
      "active": false,
    },
    {
      "name": "Tara Spken",
      "active": false,
    },
    {
      "name": "Red Mcdisc",
      "active": false,
    },
  ];

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

  @override
  void dispose() {
    _startDayController.dispose();
    _endDayController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
                    _buildStepNumberRow(),
                    SizedBox(height: 20),
                    // STEP ONE ELEMENTS
                    if (_formStep == 0) ...[
                      _buildImageploader(),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _titleController,
                        validator: (value) => value.length >= 5
                            ? null
                            : 'Please enter a valid event name.',
                        decoration: _buildInputDecoration('Event name', null),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        minLines: 3,
                        maxLines: 10,
                        controller: _descriptionController,
                        validator: (value) => value.length >= 5
                            ? null
                            : 'Please enter a valid event descirption.',
                        decoration:
                            _buildInputDecoration('Event description', null),
                      ),
                    ],
                    // STEP 2 ELEMENTs
                    if (_formStep == 1) ...[
                      SizedBox(height: 10),
                      _buildDropdownButtonFormField(
                          _categories,
                          _formContent['category'] == null
                              ? _selectedCategory
                              : _formContent['category'],
                          "Category"),
                      SizedBox(height: 10),
                      _buildDateRow(context),
                      SizedBox(height: 10),
                      _buildCheckBoxRow(),
                    ],
                    // STEP THREE ELEMENTS
                    if (_formStep == 2) ...[
                      SizedBox(height: 10),
                      _buildDropdownButtonFormField(
                          _regions, _selectedRegion, "Region"),
                      SizedBox(height: 10),
                      _buildDropdownButtonFormField(
                          _places, _selectedPlace, "Place"),
                    ],
                    SizedBox(height: 10),
                    // STEP FOUR ELEMENTS
                    if (_formStep == 3) ...[
                      Text("Privacy : "),
                      SizedBox(height: 10),
                      _buildPrivacyButtons(),
                      SizedBox(height: 10),
                      _buildFriendList(),
                      SizedBox(height: 10),
                      RaisedButton(
                        onPressed: () {
                          print(_formContent);
                        },
                        color: backgroundColor,
                        child: Text("Create event"),
                        textColor: primColor,
                      )
                    ],
                    SizedBox(height: 10),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  ExpansionTile _buildFriendList() {
    return ExpansionTile(
      title: Text('Invite Friends'),
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: _friendList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final currentItem = _friendList[index];
            return InkWell(
              onTap: () {
                setState(() {
                  currentItem['active'] = !currentItem['active'];
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(11.0),
                  margin: EdgeInsets.all(5),
                  color: currentItem['active'] ? backgroundColor : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: backgroundColor,
                              child: Text(
                                currentItem['name'].toString()[0],
                                style: TextStyle(color: Colors.white),
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("${currentItem['name']}"),
                          ),
                        ],
                      ),
                      if (currentItem['active']) Icon(Icons.check)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Row _buildPrivacyButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          color: _isPrivate ? backgroundColor : null,
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
          color: !_isPrivate ? backgroundColor : null,
          child: Text('Public'),
        )
      ],
    );
  }

  Row _buildStepNumberRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _formStep = 0;
              _stepText = setFormStepText(_formStep);
            });
          },
          child: CircleAvatar(
            backgroundColor:
                _formStep != 0 ? Colors.grey.withAlpha(50) : backgroundColor,
            child: Text("1", style: TextStyle(color: Colors.white)),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _formStep = 1;
              _stepText = setFormStepText(_formStep);
            });
          },
          child: CircleAvatar(
            backgroundColor:
                _formStep != 1 ? Colors.grey.withAlpha(50) : backgroundColor,
            child: Text("2", style: TextStyle(color: Colors.white)),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _formStep = 2;
              _stepText = setFormStepText(_formStep);
            });
          },
          child: CircleAvatar(
            backgroundColor:
                _formStep != 2 ? Colors.grey.withAlpha(50) : backgroundColor,
            child: Text("3", style: TextStyle(color: Colors.white)),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _formStep = 3;
              _stepText = setFormStepText(_formStep);
            });
          },
          child: CircleAvatar(
            backgroundColor:
                _formStep != 3 ? Colors.grey.withAlpha(50) : backgroundColor,
            child: Text("4", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
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
        _formStep == 0
            ? // Displaying an empty box to keep the elements centred
            SizedBox(
                height: 50,
                width: 50,
              )
            : // Displaying the actual navigation buttons.
            ClipOval(
                child: Material(
                  color: backgroundColor,
                  child: InkWell(
                    splashColor: lighterprimColor,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.arrow_back,
                        color: lighterprimColor,
                      ),
                    ),
                    onTap: _formStep == 0
                        ? null
                        : () {
                            // Stepping backwards
                            setState(() {
                              _formStep--;
                              _stepText = setFormStepText(_formStep);
                            });
                          },
                  ),
                ),
              ),
        Text(_stepText),
        _formStep == 3
            ? // Displaying an empty box to keep elements in place
            SizedBox(
                height: 50,
                width: 50,
              )
            : // Displaying the actual navigation button
            ClipOval(
                child: Material(
                  color: backgroundColor,
                  child: InkWell(
                    splashColor: lighterprimColor,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.arrow_forward,
                        color: lighterprimColor,
                      ),
                    ),
                    onTap: _formStep == 3
                        ? null
                        : () {
                            // Stepping forward
                            setState(() {
                              _formStep++;
                              _stepText = setFormStepText(_formStep);
                              if (_formStep == 1)
                                _formContent['category'] = _selectedCategory;
                              if (_formStep == 2) {
                                _formContent['place'] = _selectedPlace;
                                _formContent['region'] = _selectedRegion;
                              }
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
        onSaved: (val) {
          setState(() {
            _selectedRegion = val;
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

String setFormStepText(int formStep) {
  switch (formStep) {
    case 0:
      return "General informations";
      break;
    case 1:
      return "Date and category";
      break;
    case 2:
      return "Location";
      break;
    case 3:
      return "Privacy and invitations";
      break;
    default:
      return "General informations";
  }
}

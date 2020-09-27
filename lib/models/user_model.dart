import 'package:flutter/cupertino.dart';

class User {
  String id;
  String email;
  String name;

  User({
    @required this.id,
    @required this.email,
    @required this.name,
  });

  User.fromMap(Map<String, String> map) {
    id = map['id'];
    email = map['email'];
    name = map['name'];
  }
}

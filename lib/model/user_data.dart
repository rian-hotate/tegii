import 'package:flutter/cupertino.dart';

enum GENDER { man, woman, other }

class UserData {
  final String name;
  final DateTime birthday;
  final GENDER gender;
  final int age;

  UserData({
    @required this.name,
    @required this.birthday,
    @required this.gender,
    @required this.age,
  });
}

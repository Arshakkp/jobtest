import 'package:flutter/foundation.dart';

class Person {
  int id;
  String email;
  String f_name;
  String l_name;
  String image_url;
  Person(
      {required this.id,
      required this.email,
      required this.f_name,
      required this.image_url,
      required this.l_name});
  factory Person.fromJson(Map<String, dynamic> data) {
    return Person(
        id: data['id'],
        email: data['email'],
        f_name: data['first_name'],
        l_name: data['last_name'],
        image_url: data['avatar']);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  final String name;
  final String position;

  Person({required this.name, required this.position});
  Map<String , dynamic >toJson() => {
    'name':name,
    'position':position,

  };

  static Person fromJson(Map<String,dynamic> json) => Person(
      name: json['name'],
      position: json['position']
  );
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gym_graduation_app/constants.dart';

class PersonModel {
  final String? role;
  String? deviceToken;
  final String id;
  final String name;
  final String email;
  final String? photo;
  num? age;
  List private;

  PersonModel({
    this.role = "user",
    this.deviceToken,
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    this.age,
    this.private = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "role": role,
      "deviceToken": deviceToken,
      "id": id,
      "name": name,
      "email": email,
      "photo": photo,
      "age": age,
      "private": private,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      role: map["user"]["role"],
      deviceToken: map["user"]["deviceToken"],
      id: map["user"]["_id"],
      name: map["user"]["name"],
      email: map["user"]["email"],
      photo: 'http://$server/img/users/${map["user"]["photo"]}',
      age: map["user"]["age"],
      // private: List.from(map["private"]["trainer"] as List),
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) => PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PersonModel copyWith({
    String? role,
    String? deviceToken,
    String? id,
    String? name,
    String? email,
    String? photo,
    List? private,
  }) {
    return PersonModel(
      role: role ?? this.role,
      deviceToken: deviceToken ?? this.deviceToken,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      private: private ?? this.private,
    );
  }

  @override
  String toString() {
    return 'PersonModel(role: $role, deviceToken: $deviceToken, id: $id, name: $name, email: $email, photo: $photo, age: $age, private: $private)';
  }
}

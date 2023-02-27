import 'dart:convert';

class PersonModel {
  final String role;
  final String? deviceToken;
  final String? username;
  final String? password;
  final int id;
  final String name;
  final int age;
  final String email;
  final String phone;
  final String image;
  num? height;
  num? weight;
  List contractors;

  PersonModel({
    required this.role,
    this.deviceToken,
    this.username,
    this.password,
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    this.image = "",
    this.height,
    this.weight,
    this.contractors = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'deviceToken': deviceToken,
      'username': username,
      'password': password,
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'phone': phone,
      'image': image,
      'height': height,
      'weight': weight,
      'contractors': contractors,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      role: map['role'],
      deviceToken: map['deviceToken'],
      username: map['username'],
      password: map['password'],
      id: map['id'] as int,
      name: map['name'],
      age: map['age'] as int,
      email: map['email'],
      phone: map['phone'],
      image: map['image'],
      height: map['height'] != null ? map['height'] as num : null,
      weight: map['weight'] != null ? map['weight'] as num : null,
      contractors: List.from(map['contractors'] as List),
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) => PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PersonModel copyWith({
    String? role,
    String? deviceToken,
    String? username,
    String? password,
    int? id,
    String? name,
    int? age,
    String? email,
    String? phone,
    String? image,
    num? height,
    num? weight,
    List? contractors,
  }) {
    return PersonModel(
      role: role ?? this.role,
      deviceToken: deviceToken ?? this.deviceToken,
      username: username ?? this.username,
      password: password ?? this.password,
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      contractors: contractors ?? this.contractors,
    );
  }
}

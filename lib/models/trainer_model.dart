import 'dart:convert';

import 'package:gym_graduation_app/models/trainee_model.dart';

import 'person_model.dart';

class TrainerModel extends PersonModel {
  final String trainClass;
  final String biography;
  final int yearsOfExp;

  TrainerModel({
    required String role,
    String? username,
    String? password,
    required int id,
    required String name,
    required int age,
    required String email,
    required String phone,
    required this.trainClass,
    required this.biography,
    required this.yearsOfExp,
    dynamic image,
    num? height,
    num? weight,
    List? contractors,
  }) : super(
            role: role, username: username, password: password, id: id, name: name, age: age, email: email, phone: phone, image: image, height: height, weight: weight, contractors: contractors ?? []);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'username': username,
      'password': password,
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'phone': phone,
      'image': image,
      'weight': weight,
      'height': height,
      'trainClass': trainClass,
      'biography': biography,
      'yearsOfExp': yearsOfExp,
      'contractors': contractors.map((x) => x.toMap()).toList(),
    };
  }

  factory TrainerModel.fromMap(Map<String, dynamic> map) {
    return TrainerModel(
      role: map['role'],
      username: map['username'],
      password: map['password'],
      id: map['id'],
      name: map['name'],
      age: map['age'],
      email: map['email'],
      phone: map['phone'],
      image: map['image'] ?? 'assets/images/Trainer_avatar.png',
      weight: map['weight'],
      height: map['height'],
      trainClass: map['trainClass'],
      biography: map['biography'],
      yearsOfExp: map['yearsOfExp'],
      contractors: map['contractors'] == null
          ? []
          : List<TraineeModel>.from(
              map['contractors'].map((x) => TraineeModel.fromMap(x)),
            ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainerModel.fromJson(String source) => TrainerModel.fromMap(jsonDecode(source));
}

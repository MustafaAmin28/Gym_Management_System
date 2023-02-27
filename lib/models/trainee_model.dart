import 'dart:convert';
import 'person_model.dart';
import 'trainer_model.dart';

class TraineeModel extends PersonModel {
  // List<TrainerModel>? contractors = [];

  TraineeModel({
    required String role,
    String? username,
    String? password,
    required int id,
    required String name,
    required int age,
    required String email,
    required String phone,
    dynamic image,
    num? height,
    num? weight,
    List? contractors,
  }) : super(
          role: role,
          username: username,
          password: password,
          id: id,
          name: name,
          age: age,
          email: email,
          phone: phone,
          image: image,
          height: height,
          weight: weight,
          contractors: contractors ?? [],
        );

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
      'contractors': contractors.map((x) => x.toMap()).toList(),
    };
  }

  factory TraineeModel.fromMap(Map<String, dynamic> map) {
    return TraineeModel(
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
      contractors: List<TrainerModel>.from(
        map['contractors'].map((x) => TrainerModel.fromMap(x)),
      ),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory TraineeModel.fromJson(String source) => TraineeModel.fromMap(jsonDecode(source));
}

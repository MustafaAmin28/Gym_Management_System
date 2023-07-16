import 'dart:convert';

import 'package:gym_graduation_app/constants.dart';
import 'package:gym_graduation_app/models/trainee_model.dart';

import 'person_model.dart';

class TrainerModel extends PersonModel {
  final String biography;
  final String experience;
  String phone;
  List skills;

  TrainerModel({
    required String id,
    String role = "trainer",
    required String name,
    String? photo,
    required num age,
    required String email,
    required this.phone,
    required this.biography,
    required this.experience,
    required this.skills,
    List? private,
  }) : super(role: role, id: id, name: name, age: age, email: email, private: private ?? [], photo: photo);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "role": role,
      "_id": id,
      "name": name,
      "skills": skills,
      "age": age,
      "email": email,
      "phone": phone,
      "image": photo,
      "biography": biography,
      "experience": experience,
      "private": private.map((x) => x.toMap()).toList(),
    };
  }

  factory TrainerModel.fromMap(Map<String, dynamic> map) {
    return TrainerModel(
        role: map["trainer"]["role"] ?? "trainer",
        id: map["trainer"]["signId"] ?? map["trainer"]["_id"],
        name: map["trainer"]["name"],
        age: map["trainer"]["age"],
        skills: map["trainer"]["skills"] ?? [],
        email: map["trainer"]["email"],
        phone: map["trainer"]["phone"],
        photo: map["trainer"]["image"] == null ? null : "http://$server/img/trainers/${map["trainer"]["image"]}",
        biography: map["trainer"]["biography"],
        experience: map["trainer"]["experience"],
        private: map["private"] == null
            ? []
            : (map["private"] is List)
                ? List<TraineeModel>.from(map["private"].map((x) => TraineeModel.fromPrivateMap(x["trainee"])))
                : [TraineeModel.fromPrivateMap(map["private"]["trainee"])]);
  }
  factory TrainerModel.trainersFromMap(Map<String, dynamic> map) {
    return TrainerModel(
      role: map["role"] ?? "trainer",
      id: map["signId"] ?? map["_id"],
      name: map["name"],
      age: map["age"],
      skills: map["skills"] ?? [],
      email: map["email"],
      phone: map["phone"],
      photo: map["image"] == null ? null : "http://$server/img/trainers/${map["image"]}",
      biography: map["biography"],
      experience: map["experience"],
    );
  }

  factory TrainerModel.fromPrivateMap(Map<String, dynamic> map) {
    return TrainerModel(
      role: map["role"] ?? "trainer",
      id: map["signId"] ?? map["_id"],
      name: map["name"],
      age: map["age"],
      skills: map["skills"] ?? [],
      email: map["email"],
      phone: map["phone"],
      photo: map["image"] == null ? null : "http://$server/img/trainers/${map["image"]}",
      biography: map["biography"],
      experience: map["experience"],
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory TrainerModel.fromJson(String source) => TrainerModel.fromMap(jsonDecode(source));
}

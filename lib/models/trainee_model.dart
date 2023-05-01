import 'dart:convert';

import 'package:gym_graduation_app/constants.dart';

import 'person_model.dart';
import 'trainer_model.dart';

class TraineeModel extends PersonModel {
  TraineeModel({
    String role = "trainee",
    required String id,
    required String name,
    required String email,
    String? photo,
    String? deviceToken,
    List? private,
  }) : super(
          role: role,
          id: id,
          name: name,
          email: email,
          photo: photo,
          deviceToken: deviceToken,
          private: private ?? [],
        );

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "role": role,
      "id": id,
      "name": name,
      "email": email,
      "image": photo,
      "private": private.map((x) => x.toMap()).toList(),
    };
  }

  factory TraineeModel.fromMap(Map<String, dynamic> map) {
    return TraineeModel(
      role: map["user"]["role"] ?? "trainee",
      id: map["user"]["_id"],
      name: map["user"]["name"],
      email: map["user"]["email"],
      photo: map["user"]["photo"] == null ? null : "http://$server/img/users/${map["user"]["photo"]}",
      deviceToken: map["user"]["deviceToken"] ?? " ",
      private: map["private"] == null
          ? []
          : (map["private"] is List)
              ? List<TrainerModel>.from(map["private"].map((x) => TrainerModel.fromPrivateMap(x["trainer"])))
              : [TrainerModel.fromPrivateMap(map["private"]["trainer"])],
    );
  }

  factory TraineeModel.traineesFromMap(Map<String, dynamic> map) {
    return TraineeModel(
      role: map["role"] ?? "trainee",
      id: map["_id"],
      name: map["name"],
      email: map["email"],
      photo: map["photo"] == null ? null : "http://$server/img/users/${map["photo"]}",
    );
  }
  factory TraineeModel.fromPrivateMap(Map<String, dynamic> map) {
    return TraineeModel(
      role: map["role"] ?? "trainee",
      id: map["_id"],
      name: map["name"],
      email: map["email"],
      photo: map["photo"] == null ? null : "http://$server/img/users/${map["photo"]}",
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory TraineeModel.fromJson(String source) => TraineeModel.fromMap(jsonDecode(source));
}

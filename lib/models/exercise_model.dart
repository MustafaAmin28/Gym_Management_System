import 'dart:convert';

import 'package:gym_graduation_app/constants.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExerciseModel {
  final String? img;
  final String name;
  final String video;
  final String type;
  final List? steps;
  ExerciseModel({
    this.img,
    required this.name,
    required this.video,
    required this.type,
    required this.steps,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "img": img,
      "name": name,
      "video": video,
      "type": type,
      "steps": steps,
    };
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      img: map["img"] != null ? map["img"] as String : null,
      name: map["name"] as String,
      video: "http://$server/video/exercises/${map["video"]}",
      type: map["type"] as String,
      steps: map["steps"] == null ? null : List.from(map["steps"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseModel.fromJson(String source) => ExerciseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return "ExerciseModel(img: $img, name: $name, video: $video, type: $type, steps: $steps)";
  }
}

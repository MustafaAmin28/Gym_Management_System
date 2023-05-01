// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gym_graduation_app/constants.dart';

class RecipeModel {
  final String? img;
  final String name;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> nutration;
  RecipeModel({
    required this.img,
    required this.name,
    required this.ingredients,
    required this.steps,
    required this.nutration,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'img': img,
      'name': name,
      'ingredients': ingredients,
      'steps': steps,
      'nutration': nutration,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
        img: map['img'] == null ? null : "http://$server/img/receipes/${map["img"]}",
        name: map['name'],
        ingredients: List<String>.from(map['ingredients']),
        steps: List<String>.from(map['steps']),
        nutration: List<String>.from(map['nutration']));
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) => RecipeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecipeModel(img: $img, name: $name, ingredients: $ingredients, steps: $steps, nutration: $nutration)';
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_graduation_app/constants.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class Api {
  static Future<dynamic> getUser({String? userId}) async {
    http.Response response;
    try {
      if (userId == null) {
        response = await http.get(Uri.parse("http://$server/api/v1/users"));
      } else {
        response = await http.get(Uri.parse("http://$server/api/v1/users/$userId"));
      }

      return jsonDecode(response.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> getDeviceToken({required String email}) async {
    try {
      http.Response response = await http.get(Uri.parse("http://$server/api/v1/users/?email=$email"));
      return jsonDecode(response.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> getRecipes() async {
    try {
      http.Response response = await http.get(Uri.parse("http://$server/api/v1/receipies"));
      return jsonDecode(response.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> getExercises({required String type}) async {
    try {
      http.Response response = await http.get(Uri.parse("http://$server/api/v1/exercises?type=$type"));
      return jsonDecode(response.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> getTrainer({String? trainerEmail}) async {
    http.Response response;
    try {
      if (trainerEmail == null) {
        response = await http.get(Uri.parse("http://$server/api/v1/trainers"));
      } else {
        response = await http.get(Uri.parse("http://$server/api/v1/trainers/$trainerEmail"));
      }

      return jsonDecode(response.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> login({required Map<String, String> body}) async {
    try {
      http.Response response = await http.post(
        Uri.parse("http://$server/api/v1/users/login"),
        body: jsonEncode(body),
        headers: {"content-type": "application/json"},
      );
      return jsonDecode(response.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> addIncome({required Map<String, dynamic> body}) async {
    try {
      http.Response response = await http.post(
        Uri.parse("http://$server/api/v1/incomes"),
        body: jsonEncode(body),
        headers: {"content-type": "application/json"},
      );
      return jsonDecode(response.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> patchDeviceToken({required String userId, required String deviceToken}) async {
    try {
      http.Response response = await http.patch(
        Uri.parse("http://$server/api/v1/users/$userId"),
        body: jsonEncode({"deviceToken": deviceToken}),
        headers: {"content-type": "application/json"},
      );
      return jsonDecode(response.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> createExercise({required List<int> videoBytes, required String name, required String type, required List<String> steps}) async {
    try {
      Uri uri = Uri.parse("http://$server/api/v1/exercises");

      final multipartFile = http.MultipartFile.fromBytes("video", videoBytes, filename: "exercise", contentType: MediaType('video', 'mp4'));
      final request = http.MultipartRequest("POST", uri)
        ..fields["name"] = name
        ..fields["type"] = type
        ..files.add(multipartFile);
      for (int i = 0; i < steps.length; i++) {
        request.fields["steps[$i]"] = steps[i];
      }

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      return jsonDecode(responseData.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> register({required List<int> imgBytes, required String name, required String email, required String password, required String confirmPassword}) async {
    try {
      Uri uri = Uri.parse("http://$server/api/v1/users/signup");

      final multipartFile = http.MultipartFile.fromBytes("photo", imgBytes, filename: "user", contentType: MediaType('image', 'png'));
      final request = http.MultipartRequest("POST", uri)
        ..fields["name"] = name
        ..fields["email"] = email
        ..fields["password"] = password
        ..fields["passwordConfirm"] = confirmPassword
        ..files.add(multipartFile);

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      return jsonDecode(responseData.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> createRecipe({required List<int> imgBytes, required String name, required List<String> ingredients, required List<String> steps, required List<String> nutration}) async {
    try {
      Uri uri = Uri.parse("http://$server/api/v1/receipies");

      final multipartFile = http.MultipartFile.fromBytes("img", imgBytes, filename: "recipe.png", contentType: MediaType('image', 'png'));
      final request = http.MultipartRequest("POST", uri)
        ..fields["name"] = name
        ..files.add(multipartFile);
      for (int i = 0; i < steps.length; i++) {
        request.fields["steps[$i]"] = steps[i];
      }
      for (int i = 0; i < ingredients.length; i++) {
        request.fields["ingredients[$i]"] = ingredients[i];
      }
      for (int i = 0; i < nutration.length; i++) {
        request.fields["nutration[$i]"] = nutration[i];
      }

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);
      return jsonDecode(responseData.body);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future<dynamic> getCurrentTime({String timeZone = "Africa/Cairo"}) async {
    try {
      http.Response response = await http.get(Uri.parse("https://worldtimeapi.org/api/timezone/$timeZone"));

      return DateTime.parse(jsonDecode(response.body)["datetime"]);
    } on Exception catch (e) {
      return DateTime.now();
    }
  }
}

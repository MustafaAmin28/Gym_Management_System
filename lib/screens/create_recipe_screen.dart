import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/components/custom_elevated_button.dart';
import 'package:gym_graduation_app/components/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import '../helper/api.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController recipeName = TextEditingController();
  TextEditingController recipeIngredients = TextEditingController();
  TextEditingController recipeNutrations = TextEditingController();
  TextEditingController recipeSteps = TextEditingController();
  String imageName = "Pick an image...";
  Uint8List? recipeImage;
  List<String> steps = [];
  List<String> ingredients = [];
  List<String> nutrations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Create Recipe",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        leading: const Icon(
          FontAwesomeIcons.bowlFood,
          color: Colors.white,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            hintText: "Recipe Name",
            labelText: "Name",
            controller: recipeName,
            fillColor: Colors.white.withOpacity(0.1),
            mainColor: kPrimaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 340,
                child: CustomTextFormField(
                  maxLines: 5,
                  hintText: "Recipe Ingredients",
                  labelText: "Ingreidents",
                  controller: recipeIngredients,
                  fillColor: Colors.white.withOpacity(0.1),
                  mainColor: kPrimaryColor,
                ),
              ),
              IconButton(
                  iconSize: 30,
                  onPressed: () {
                    if (recipeIngredients.text.isNotEmpty) {
                      setState(() {
                        ingredients.add(recipeIngredients.text);
                        recipeIngredients.clear();
                      });
                    } else {
                      Fluttertoast.showToast(msg: "You must enter a step, this field cannot be empty!");
                    }
                  },
                  icon: const Icon(
                    FontAwesomeIcons.circlePlus,
                    color: kPrimaryColor,
                  ))
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: kPrimaryColor)),
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 240,
                          child: Text(
                            "${index + 1}. ${ingredients[index]}",
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ingredients.removeAt(index);
                            setState(() {});
                          },
                          child: Icon(
                            FontAwesomeIcons.x,
                            color: kPrimaryColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Row(
            children: [
              SizedBox(
                width: 340,
                child: CustomTextFormField(
                  maxLines: 5,
                  hintText: "Recipe Nutrations",
                  labelText: "Nutrations",
                  controller: recipeNutrations,
                  fillColor: Colors.white.withOpacity(0.1),
                  mainColor: kPrimaryColor,
                ),
              ),
              IconButton(
                  iconSize: 30,
                  onPressed: () {
                    if (recipeNutrations.text.isNotEmpty) {
                      setState(() {
                        nutrations.add(recipeNutrations.text);
                        recipeNutrations.clear();
                      });
                    } else {
                      Fluttertoast.showToast(msg: "You must enter a step, this field cannot be empty!");
                    }
                  },
                  icon: const Icon(
                    FontAwesomeIcons.circlePlus,
                    color: kPrimaryColor,
                  ))
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: kPrimaryColor)),
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: nutrations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 240,
                          child: Text(
                            "${index + 1}. ${nutrations[index]}",
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            nutrations.removeAt(index);
                            setState(() {});
                          },
                          child: Icon(
                            FontAwesomeIcons.x,
                            color: kPrimaryColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Row(
            children: [
              SizedBox(
                width: 340,
                child: CustomTextFormField(
                  maxLines: 5,
                  hintText: "Recipe Steps",
                  labelText: "Steps",
                  controller: recipeSteps,
                  fillColor: Colors.white.withOpacity(0.1),
                  mainColor: kPrimaryColor,
                ),
              ),
              IconButton(
                  iconSize: 30,
                  onPressed: () {
                    if (recipeSteps.text.isNotEmpty) {
                      setState(() {
                        steps.add(recipeSteps.text);
                        recipeSteps.clear();
                      });
                    } else {
                      Fluttertoast.showToast(msg: "You must enter a step, this field cannot be empty!");
                    }
                  },
                  icon: const Icon(
                    FontAwesomeIcons.circlePlus,
                    color: kPrimaryColor,
                  ))
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: kPrimaryColor)),
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 240,
                          child: Text(
                            "${index + 1}. ${steps[index]}",
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            steps.removeAt(index);
                            setState(() {});
                          },
                          child: Icon(
                            FontAwesomeIcons.x,
                            color: kPrimaryColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    imageName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                CustomElevatedButton(
                    buttonText: "Browse",
                    height: 40,
                    width: 80,
                    buttonColor: kPrimaryColor,
                    onTap: () async {
                      XFile? video = await _picker.pickImage(source: ImageSource.gallery);
                      if (video != null) {
                        recipeImage = await video.readAsBytes();
                        imageName = video.name;
                      }
                      setState(() {});
                    })
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomElevatedButton(
                buttonText: "Add",
                height: 50,
                width: 150,
                buttonColor: kPrimaryColor,
                onTap: () async {
                  if (steps.isNotEmpty && recipeImage != null && recipeName.text.isNotEmpty && ingredients.isNotEmpty && nutrations.isNotEmpty) {
                    final response = await Api.createRecipe(imgBytes: recipeImage!, name: recipeName.text, ingredients: ingredients, steps: steps, nutration: nutrations);
                    if (response["status"] == "success") {
                      Fluttertoast.showToast(msg: "Submitted");
                      recipeName.clear();
                      ingredients.clear();
                      nutrations.clear();
                      steps.clear();
                      recipeImage = null;
                      imageName = "Pick an image...";
                      setState(() {});
                    } else {
                      Fluttertoast.showToast(msg: response["message"]);
                    }
                  } else {
                    Fluttertoast.showToast(msg: "Please fill all fields before submitting");
                  }
                }),
          )
        ],
      ),
    );
  }
}

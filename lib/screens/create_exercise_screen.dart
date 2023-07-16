import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/components/custom_elevated_button.dart';
import 'package:gym_graduation_app/components/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import '../helper/api.dart';

class CreateExerciseScreen extends StatefulWidget {
  const CreateExerciseScreen({super.key});

  @override
  State<CreateExerciseScreen> createState() => _CreateExerciseScreenState();
}

class _CreateExerciseScreenState extends State<CreateExerciseScreen> {
  TextEditingController exerciseName = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  TextEditingController exerciseSteps = TextEditingController();
  String? dropdownValue, exerciseType;
  String videoName = "Pick a video...";
  Uint8List? exerciseVideo;
  List<String> steps = [];
  List<String> exerciseTypeList = ["Chest", "Back", "Shoulders", "Arms", "Legs", "Warm up: Lower part", "Warm up: Upper part"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Create Exercise",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        leading: const Icon(
          FontAwesomeIcons.dumbbell,
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
            hintText: "Exercise Name",
            labelText: "Name",
            controller: exerciseName,
            fillColor: Colors.white.withOpacity(0.1),
            mainColor: kPrimaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(border: Border.all(color: kPrimaryColor), borderRadius: BorderRadius.circular(6), color: Colors.white.withOpacity(0.1)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                iconEnabledColor: kPrimaryColor,
                menuMaxHeight: 250,
                dropdownColor: Colors.grey.shade800,
                style: const TextStyle(color: kPrimaryColor),
                hint: const Text(
                  "Choose Exercise Type",
                  style: TextStyle(color: kPrimaryColor),
                ),
                value: dropdownValue,
                isExpanded: true,
                items: exerciseTypeList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => setState(() {
                  dropdownValue = value as String;
                  if (dropdownValue == "Chest") {
                    exerciseType = "chest";
                  } else if (dropdownValue == "Back") {
                    exerciseType = "back";
                  } else if (dropdownValue == "Shoulders") {
                    exerciseType = "shoulders";
                  } else if (dropdownValue == "Arms") {
                    exerciseType = "arm";
                  } else if (dropdownValue == "Legs") {
                    exerciseType = "legs";
                  } else if (dropdownValue == "Warm up: Lower part") {
                    exerciseType = "warm_up_lower";
                  } else if (dropdownValue == "Warm up: Upper part") {
                    exerciseType = "warm_up_upper";
                  }
                }),
              ),
            ),
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
                  hintText: "Exercise Steps",
                  labelText: "Steps",
                  controller: exerciseSteps,
                  fillColor: Colors.white.withOpacity(0.1),
                  mainColor: kPrimaryColor,
                ),
              ),
              IconButton(
                  iconSize: 30,
                  onPressed: () {
                    if (exerciseSteps.text.isNotEmpty) {
                      setState(() {
                        steps.add(exerciseSteps.text);
                        exerciseSteps.clear();
                      });
                    } else {
                      Fluttertoast.showToast(msg: "You must enter at least one step, this field cannot be empty!");
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: kPrimaryColor,
                )),
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
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
                    videoName,
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
                      XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
                      if (video != null) {
                        exerciseVideo = await video.readAsBytes();
                        videoName = video.name;
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
                  if (steps.isNotEmpty && exerciseVideo != null && exerciseName.text.isNotEmpty && exerciseType != null) {
                    final response = await Api.createExercise(videoBytes: exerciseVideo!, name: exerciseName.text, type: exerciseType!, steps: steps);
                    if (response["status"] == "success") {
                      Fluttertoast.showToast(msg: "Submitted");
                      exerciseName.clear();
                      exerciseSteps.clear();
                      steps.clear();
                      exerciseVideo = null;
                      videoName = "Pick a video...";
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

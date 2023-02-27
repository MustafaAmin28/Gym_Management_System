import 'package:flutter/material.dart';
import 'package:gym_graduation_app/screens/specific_body_part_exercises.dart';
import '../constants.dart';

class CustomExerciseInkWell extends StatelessWidget {
  CustomExerciseInkWell({
    required this.image,
    required this.title,
    this.textBackgroundColor = Colors.white,
    this.textColor = Colors.white,
    this.height = 140,
  });

  String image, title;
  double? height;
  Color? textBackgroundColor, textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink.image(
        image: AssetImage(image),
        fit: BoxFit.cover,
        height: height,
        width: double.infinity,
        child: InkWell(
            highlightColor: Colors.yellow.withOpacity(0.2),
            splashColor: kPrimaryColor.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: textBackgroundColor,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 120,
                    height: 40,
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(color: textColor, fontSize: 22, fontFamily: kFontFamily),
                      ),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SpecificBodyPartExercisesScreen(
                  bodyPartName: title,
                );
              }));
            }),
      ),
    );
  }
}

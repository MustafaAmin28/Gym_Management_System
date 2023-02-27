import 'package:flutter/material.dart';
import '../components/custom_inkwell.dart';
import '../models/trainClass_model.dart';
import 'class_screen.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: trainClasses.length,
      itemBuilder: ((context, index) {
        return CustomInkWell(
          image: trainClasses[index].backgroundImage,
          height: 140,
          title: trainClasses[index].title,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ClassScreen(
                className: trainClasses[index].title,
              );
            }));
          },
          textBackgroundColor: Colors.white.withOpacity(0.2),
          textColor: Colors.white,
        );
      }),
    );
  }
}

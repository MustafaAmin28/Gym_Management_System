import 'package:flutter/material.dart';
import '../screens/exercise_video_screen.dart';

class ExerciseCard extends StatelessWidget {
  ExerciseCard({required this.thumbnailPath, required this.exerciseTitle, required this.exerciseDescription, required this.videoPath, required this.steps});
  String thumbnailPath, exerciseTitle, exerciseDescription, videoPath;
  List<String> steps = [];
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(6),
      color: Colors.grey.shade800,
      child: InkWell(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(thumbnailPath),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 100,
                  child: Text(
                    exerciseTitle,
                    style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  exerciseDescription,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          )
        ]),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ExerciseVideoScreen(title: exerciseTitle, videoPath: videoPath, steps: steps);
          }));
        },
      ),
    );
  }
}

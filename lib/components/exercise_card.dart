import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gym_graduation_app/constants.dart';
import 'package:gym_graduation_app/models/exercise_model.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../screens/exercise_video_screen.dart';

// ignore: must_be_immutable
class ExerciseCard extends StatefulWidget {
  ExerciseCard({super.key, required this.exercise});
  ExerciseModel exercise;

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  // VideoPlayerController? _controller;
  Uint8List? thumbnail;
  @override
  void initState() {
    super.initState();
    if (thumbnail == null) {
      VideoThumbnail.thumbnailData(
        video: widget.exercise.video,
        imageFormat: ImageFormat.PNG,
        maxWidth: 600, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      ).then((value) {
        if (mounted) {
          thumbnail = value;
          setState(() {});
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(6),
      color: Colors.grey.shade800,
      child: InkWell(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 150,
              height: 150,
              child: thumbnail != null
                  ? Image.memory(
                      thumbnail!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      kExerciseThumbnail,
                      fit: BoxFit.cover,
                    ),
              // _controller != null ? VideoPlayer(_controller!) : const AssetImage(kExerciseThumbnail) as Widget,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 45,
                  child: Text(
                    widget.exercise.name,
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ]),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ExerciseVideoScreen(title: widget.exercise.name, videoPath: widget.exercise.video, steps: widget.exercise.steps);
          }));
        },
      ),
    );
  }
}

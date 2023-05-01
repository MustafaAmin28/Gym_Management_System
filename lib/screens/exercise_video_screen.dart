import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import '../constants.dart';

// ignore: must_be_immutable
class ExerciseVideoScreen extends StatefulWidget {
  ExerciseVideoScreen({super.key, required this.title, required this.videoPath, required this.steps});
  // static String id = "ExerciseVideoScreen";

  String title, videoPath;
  List? steps;

  @override
  State<ExerciseVideoScreen> createState() => _ExerciseVideoScreenState();
}

class _ExerciseVideoScreenState extends State<ExerciseVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    try {
      _controller = VideoPlayerController.network(widget.videoPath);

      _controller.addListener(() {
        setState(() {});
      });
      _controller.setLooping(true);
      _controller.initialize().then((_) => setState(() {}));
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: "There is an error in loading video! ${e.toString()}");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          LimitedBox(
            maxHeight: 250,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
          VideoProgressIndicator(_controller, allowScrubbing: true, colors: const VideoProgressColors(playedColor: kPrimaryColor)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  });
                },
                icon: Icon(_controller.value.isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play),
                color: kPrimaryColor,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.steps!.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    "${widget.steps![index]}",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

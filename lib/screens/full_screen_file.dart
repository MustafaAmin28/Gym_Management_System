import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants.dart';

class FullScreenImage extends ModalRoute {
  final String? imageUrl;
  final ImageProvider? image;
  FullScreenImage({this.imageUrl, this.image});

  @override
  Duration get transitionDuration => const Duration();

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Material(
      type: MaterialType.transparency,
      child: InteractiveViewer(
        child: image != null ? Image(image: image!) : CachedNetworkImage(imageUrl: imageUrl ?? ""),
      ),
    );
  }
}

class ChatVideoScreen extends StatefulWidget {
  const ChatVideoScreen({super.key, required this.videoURL});
  final String videoURL;

  @override
  State<ChatVideoScreen> createState() => _ChatVideoScreenState();
}

class _ChatVideoScreenState extends State<ChatVideoScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();

    try {
      _controller = VideoPlayerController.network(widget.videoURL);
      _controller.addListener(() {
        setState(() {});
      });
      _controller.setLooping(false);
      _controller.initialize().then((_) => setState(() {}));
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: "There is an error in loading video!, ${e.toString()}");
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true, colors: const VideoProgressColors(playedColor: kPrimaryColor)),
                ],
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}

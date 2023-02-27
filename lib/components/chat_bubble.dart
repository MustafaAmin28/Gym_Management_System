import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/models/message_model.dart';
import 'package:gym_graduation_app/screens/login_screen.dart';
import 'package:video_player/video_player.dart';
import '../constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatBubble extends StatefulWidget {
  ChatBubble({required this.message});
  final MessageModel message;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe() ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        child: Material(
          color: isMe() ? kPrimaryColor : Colors.grey,
          elevation: 10,
          shadowColor: Colors.black,
          borderRadius: isMe()
              ? const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 320, minWidth: 30),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (widget.message.messageType == "Text") ...[
                  Text(
                    widget.message.message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ] else if (widget.message.messageType == "Image") ...[
                  GestureDetector(
                    child: CachedNetworkImage(
                      imageUrl: widget.message.message,
                      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => const Icon(
                        FontAwesomeIcons.xmark,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ChatImageScreen(fileURL: widget.message.message);
                      }));
                    },
                  ),
                ] else if (widget.message.messageType == "Video") ...[
                  GestureDetector(
                    child: Stack(children: [
                      Container(
                        width: 300,
                        height: 300,
                        color: Colors.black,
                        child: const Center(
                            child: Icon(
                          FontAwesomeIcons.solidCirclePlay,
                          size: 45,
                          color: kPrimaryColor,
                        )),
                      ),
                    ]),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ChatVideoScreen(
                          videoURL: widget.message.message,
                        );
                      }));
                    },
                  )
                ] else // ToDo: Multiple Request Fixed
                  ...[
                  const SizedBox(
                    height: 1,
                  )
                ],
                const SizedBox(
                  height: 8,
                ),
                Text("${widget.message.messageDate.toDate().hour}:${widget.message.messageDate.toDate().toLocal().minute}", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 10)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isMe() {
    if (widget.message.senderID == loginedUser.username) {
      return true;
    } else {
      return false;
    }
  }
}

class ChatImageScreen extends StatelessWidget {
  ChatImageScreen({required this.fileURL});
  String fileURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        panEnabled: false,
        minScale: 1,
        maxScale: 4,
        child: Center(
          child: CachedNetworkImage(
            width: 350,
            height: 350,
            imageUrl: fileURL,
            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(
              FontAwesomeIcons.xmark,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatVideoScreen extends StatefulWidget {
  ChatVideoScreen({required this.videoURL});
  final String videoURL;

  @override
  State<ChatVideoScreen> createState() => _ChatVideoScreenState();
}

class _ChatVideoScreenState extends State<ChatVideoScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.videoURL);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {}));
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

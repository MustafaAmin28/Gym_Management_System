import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/models/message_model.dart';
import 'package:gym_graduation_app/screens/login_screen.dart';

import '../constants.dart';
import '../screens/full_screen_file.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble({super.key, required this.message});
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
        padding: EdgeInsets.fromLTRB(isMe() ? 24 : 4, 8, isMe() ? 4 : 24, 8),
        child: Material(
          color: isMe() ? kPrimaryColor : Colors.grey,
          elevation: 4,
          shadowColor: Colors.black,
          borderRadius: isMe()
              ? const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.message.messageType == "Text") ...[
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    widget.message.message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ] else if (widget.message.messageType == "Image") ...[
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                    child: GestureDetector(
                      child: CachedNetworkImage(
                          imageUrl: widget.message.message,
                          progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Image.asset(kFailedNetworkImage)),
                      onTap: () {
                        Navigator.push(context, FullScreenImage(imageUrl: widget.message.message));
                      },
                    ),
                  ),
                ),
              ] else if (widget.message.messageType == "Video") ...[
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                    child: GestureDetector(
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
                    ),
                  ),
                )
              ] else ...[
                const SizedBox.shrink()
              ],
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 4, 4),
                child: Text("${widget.message.messageDate.toDate().hour}:${widget.message.messageDate.toDate().toLocal().minute}", style: const TextStyle(color: Colors.white70, fontSize: 10)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isMe() {
    if (widget.message.senderID == loggedUser!.email) {
      return true;
    } else {
      return false;
    }
  }
}

// class ChatImageScreen extends StatelessWidget {
//   ChatImageScreen({required this.fileURL});
//   String fileURL;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: InteractiveViewer(
//         panEnabled: false,
//         minScale: 1,
//         maxScale: 4,
//         child: Center(
//           child: CachedNetworkImage(
//             width: 350,
//             height: 350,
//             imageUrl: fileURL,
//             progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
//             errorWidget: (context, url, error) => const Icon(
//               FontAwesomeIcons.xmark,
//               color: Colors.red,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



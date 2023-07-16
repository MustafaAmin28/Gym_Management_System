import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/screens/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import '../components/chat_bubble.dart';
import '../constants.dart';
import '../fcm_service.dart' as fcm;
import '../helper/api.dart';
import '../models/message_model.dart';
import '../models/person_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.receiverParticipant, this.deviceToken});
  PersonModel receiverParticipant;
  String? deviceToken;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();

  XFile? pickedFile;
  bool isUploading = false;

  final ImagePicker _picker = ImagePicker();

  final scrollController = ScrollController();
  CollectionReference messages = FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('messageDate', descending: true).snapshots(),
        builder: (context, snapshot) {
          List<MessageModel> messageList = [];
          if (snapshot.data != null) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 16,
                    backgroundImage: (widget.receiverParticipant.photo == null
                        ? AssetImage(kPersonAvatar)
                        : CachedNetworkImageProvider(widget.receiverParticipant.photo!, errorListener: () => Image.asset(kFailedNetworkImage))) as ImageProvider,
                  ),
                  const SizedBox(width: 8),
                  Text(widget.receiverParticipant.name),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: messageList.isEmpty
                      ? const Center(
                          child: Text(
                            'There is no messages yet',
                            style: TextStyle(color: Colors.black, fontSize: 26),
                          ),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          controller: scrollController,
                          itemCount: messageList.length,
                          itemBuilder: (context, index) {
                            if ((messageList[index].senderID == loggedUser!.email && messageList[index].receiverID == widget.receiverParticipant.email) ||
                                (messageList[index].senderID == widget.receiverParticipant.email && messageList[index].receiverID == loggedUser!.email)) {
                              return ChatBubble(message: messageList[index]);
                            } else {
                              return const Text("");
                            }
                          }),
                ),
                progress(),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    controller: messageController,
                    onChanged: (data) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () async {
                              showBottomSheet(context);
                            },
                            icon: const Icon(
                              FontAwesomeIcons.paperclip,
                              color: kPrimaryColor,
                            ),
                            color: kPrimaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            onPressed: () async {
                              try {
                                if (messageController.text.isNotEmpty) {
                                  addMessage(sentMessage: messageController.text, messageType: 'Text');
                                  print(widget.receiverParticipant.email);
                                  messageController.clear();
                                  scrollController.jumpTo(0);
                                }
                              } on Exception catch (e) {
                                Fluttertoast.showToast(msg: e.toString());
                              }
                            },
                            icon: Icon(
                              Icons.send,
                              color: messageController.text.isEmpty ? Colors.grey.withOpacity(0.5) : kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      hintText: 'Send a message',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  // return Scaffold(
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      context: context,
      builder: (context) => SizedBox(
        height: 250,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.camera_alt,
              ),
              title: const Text('Pick an image from gallery'),
              onTap: () async {
                pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  addMessage(sentMessage: await uploadFile(), messageType: 'Image');
                }
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.video_camera_back,
              ),
              title: const Text('Pick a video from gallery'),
              onTap: () async {
                pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
                if (pickedFile != null) {
                  addMessage(sentMessage: await uploadFile(), messageType: 'Video');
                }
              },
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a picture'),
              onTap: () async {
                pickedFile = await _picker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  addMessage(sentMessage: await uploadFile(), messageType: 'Image');
                }
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.video_camera_back,
              ),
              title: const Text('Take a video'),
              onTap: () async {
                pickedFile = await _picker.pickVideo(source: ImageSource.camera);
                if (pickedFile != null) {
                  addMessage(sentMessage: await uploadFile(), messageType: 'Video');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void addMessage({required sentMessage, required String messageType}) async {
    try {
      DateTime date = await Api.getCurrentTime();
      messages.add({
        'messageText': sentMessage,
        'messageType': messageType,
        'messageDate': date,
        'senderID': loggedUser!.email,
        'receiverID': widget.receiverParticipant.email,
      });
      final message = fcm.Message(
        to: widget.deviceToken,
        notification: fcm.Notification(title: "EDGE GYM", body: messageType == 'Text' ? "${loggedUser!.name}: ${sentMessage}" : "You received a media file"),
      );
      fcm.FcmService.send(message);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<String> uploadFile() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();

      Reference ref = storageRef.child('Files/${pickedFile!.name}_${DateTime.now().toString()}');
      Navigator.pop(context);

      final uploadTask = ref.putFile(File(pickedFile!.path));
      setState(() {
        isUploading = true;
      });
      await uploadTask.whenComplete(() {});
      setState(() {
        isUploading = false;
      });
      pickedFile = null;
      return await ref.getDownloadURL();
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return "There's an error";
    }
  }

  Widget progress() {
    if (isUploading) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 30,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 17,
                  width: 17,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 2,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Uploading your file",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const SizedBox(
        height: 1,
      );
    }
  }
}

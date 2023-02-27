import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/screens/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import '../components/chat_bubble.dart';
import '../constants.dart';
import '../fcm_service.dart' as fcm;
import '../models/message_model.dart';
import '../models/person_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.receiverParticipant});
  PersonModel receiverParticipant;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();

  XFile? pickedFile;
  bool isUploading = false;

  final ImagePicker _picker = ImagePicker();
  String? chatMessage;
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
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 20,
                    child: Image.asset(widget.receiverParticipant.image),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(widget.receiverParticipant.name),
                  const Spacer(
                    flex: 3,
                  ),
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
                            if ((messageList[index].senderID == loginedUser.username && messageList[index].receiverID == widget.receiverParticipant.username) ||
                                (messageList[index].senderID == widget.receiverParticipant.username && messageList[index].receiverID == loginedUser.username)) {
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
                    controller: controller,
                    onChanged: (data) {
                      setState(() {
                        chatMessage = data;
                      });
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
                                if (controller.text.isNotEmpty) {
                                  addMessage(sentMessage: chatMessage, messageType: 'Text');
                                  controller.clear();
                                  scrollController.jumpTo(0);
                                }
                              } on Exception catch (e) {
                                Fluttertoast.showToast(msg: e.toString());
                              }
                            },
                            icon: Icon(
                              Icons.send,
                              color: controller.text.isEmpty ? Colors.grey.withOpacity(0.5) : kPrimaryColor,
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
                addMessage(sentMessage: await uploadFile(), messageType: 'Image');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.video_camera_back,
              ),
              title: const Text('Pick a video from gallery'),
              onTap: () async {
                pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
                addMessage(sentMessage: await uploadFile(), messageType: 'Video');
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
                addMessage(sentMessage: await uploadFile(), messageType: 'Image');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.video_camera_back,
              ),
              title: const Text('Take a video'),
              onTap: () async {
                pickedFile = await _picker.pickVideo(source: ImageSource.camera);
                addMessage(sentMessage: await uploadFile(), messageType: 'Video');
              },
            ),
          ],
        ),
      ),
    );
  }

  void addMessage({required sentMessage, required String messageType}) async {
    messages.add({
      'messageText': sentMessage,
      'messageType': messageType,
      'messageDate': DateTime.now(),
      'senderID': loginedUser.username,
      'receiverID': widget.receiverParticipant.username,
    });
    // final message = fcm.Message(
    //   to: widget.receiverParticipant.deviceToken,
    //   data: {"sender": loginedUser.toMap()},
    //   notification: fcm.Notification(title: "A new message from ${loginedUser.username}", body: sentMessage),
    // );
    // fcm.FcmService.send(message);
  }

  Future<String> uploadFile() async {
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
    return await ref.getDownloadURL();
  }

  Widget progress() {
    if (isUploading) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 30,
          child: Container(
            color: Colors.grey,
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

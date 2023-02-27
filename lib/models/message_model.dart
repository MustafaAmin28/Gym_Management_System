import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String senderID;
  final String receiverID;
  final String messageType;
  final Timestamp messageDate;
  MessageModel({
    required this.message,
    required this.senderID,
    required this.receiverID,
    required this.messageType,
    required this.messageDate,
  });
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
        message: jsonData['messageText'],
        messageDate: jsonData['messageDate'],
        senderID: jsonData['senderID'],
        messageType: jsonData['messageType'],
        receiverID: jsonData['receiverID']);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementModel {
  final String announcement;
  final Timestamp date;
  AnnouncementModel({required this.announcement, required this.date});
  factory AnnouncementModel.fromJson(jsonData) {
    return AnnouncementModel(announcement: jsonData['announcement'], date: jsonData['date']);
  }
}

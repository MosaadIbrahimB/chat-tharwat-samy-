import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String uid;
  final String textMsg;
  final DateTime dateTime;

  MessageModel(
      {required this.uid, required this.textMsg, required this.dateTime});

  MessageModel.fromJson(json)
      : this(
          uid: json['uid'],
          textMsg: json['textMsg'],
          dateTime:(json['dateTime'] as Timestamp).toDate() ,
        );

  toJson() {
    return {
      'uid': uid,
      'textMsg': textMsg,
      'dateTime': dateTime,
    };
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? uid;
   String? email;
  final String textMsg;
   DateTime? dateTime;

  MessageModel(
      { this.email,
      this.uid,
      required this.textMsg,
       this.dateTime
      });

  MessageModel.fromJson(json)
      : this(
          uid: json['uid'],
          email: json['email'],
          textMsg: json['textMsg'],
          dateTime: (json['dateTime'] as Timestamp).toDate(),
        );

  toJson() {
    return {
      'uid': uid,
      'email': email,
      'textMsg': textMsg,
      'dateTime': dateTime,
    };
  }
}

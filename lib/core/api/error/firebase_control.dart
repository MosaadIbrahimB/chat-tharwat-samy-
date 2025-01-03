import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseControl {
  FirebaseAuth auth=FirebaseAuth.instance;

// collection  from && to
  static CollectionReference _userRef() {
    return FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static Future<void> addUser(UserModel user) {
    var folderTask = _userRef(); //folder name task
    var fileDoc = folderTask.doc(); //fileName doc
    user.uid = fileDoc.id; //number file
    return fileDoc.set(user); //write all data in file from obj tas;
  }
}

class UserModel {
  String uid;
  String name;

  UserModel({required this.name, required this.uid});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          uid: json['uid'],
          name: json['name'],
        );

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'name': name,
    };
  }
}


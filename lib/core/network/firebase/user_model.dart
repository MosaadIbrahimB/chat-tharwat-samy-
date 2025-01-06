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

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(jsonDecode(str));
// String UserDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String about;
  String skills;
  String createdAt;
  String updatedAt;
  int v;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.about,
    required this.skills,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  // Json to Dart

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    about: json["about"],
    skills: json["skills"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": int,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "about": about,
    "skills": skills,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}


/*

    {
        "_id": "6889b2a8f70064eae23d719f",
        "firstName": "sadik",
        "lastName": "Khad",
        "email": "mss.cs567@gmail.com",
        "password": "$2b$10$BwhV1F0g07ncsf3QUsTg1OF9KFsQOtMR1XWHdBON0w2WrpKa4b.Xu",
        "about": "this is the default about",
        "skills": [],
        "createdAt": "2025-07-30T05:50:33.054Z",
        "updatedAt": "2025-07-30T05:50:33.054Z",
        "__v": 0
    },
*/
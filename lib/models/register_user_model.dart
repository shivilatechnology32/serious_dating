import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) =>
    RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) =>
    json.encode(data.toJson());

class RegisterUserModel {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String profession;

  RegisterUserModel({
    required this.email,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.profession,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      RegisterUserModel(
        uid: json["uid"],
        email :json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profession: json["profession"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "profession": profession,
      };
}

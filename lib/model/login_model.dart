part of 'model.dart';

class LoginModel {
  LoginModel({
    required this.code,
    required this.status,
    required this.message,
    required this.user,
  });

  int code;
  bool status;
  String message;
  User user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );
}

class User {
  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.created,
    required this.uuid,
  });

  String name;
  String email;
  String phoneNumber;
  Created created;
  String uuid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        created: Created.fromJson(json["created"]),
        uuid: json["uuid"],
      );
}

class Created {
  Created({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}

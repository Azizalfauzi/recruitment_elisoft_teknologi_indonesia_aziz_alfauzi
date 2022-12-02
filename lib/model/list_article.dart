part of 'model.dart';

class Article {
  Article({
    required this.uuid,
    required this.title,
    required this.content,
    required this.image,
    required this.views,
    required this.created,
    required this.user,
  });

  String uuid;
  String title;
  String content;
  String image;
  int views;
  CreatedArticle created;
  UserArticle user;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        uuid: json["uuid"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        views: json["views"],
        created: CreatedArticle.fromJson(json["created"]),
        user: UserArticle.fromJson(json["user"]),
      );
}

class CreatedArticle {
  CreatedArticle({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory CreatedArticle.fromJson(Map<String, dynamic> json) => CreatedArticle(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );
}

class UserArticle {
  UserArticle({
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

  factory UserArticle.fromJson(Map<String, dynamic> json) => UserArticle(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        created: Created.fromJson(json["created"]),
        uuid: json["uuid"],
      );
}

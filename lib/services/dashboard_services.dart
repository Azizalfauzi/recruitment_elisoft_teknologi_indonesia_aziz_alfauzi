part of 'services.dart';

class DashboardServices {
  static Future<List<Article>> getDashboardData() async {
    final reponse = await Dio().get(
      'https://demo.treblle.com/api/v1/articles',
      options: Options(
        headers: {
          "content-Type": 'application/json',
          "authorization": "Bearer lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB",
        },
      ),
    );
    final json = reponse.data;

    if (reponse.statusCode == 200) {
      List<Article> result =
          (json['articles'] as Iterable).map((e) => Article.fromJson(e)).toList();
      return result;
    } else if (reponse.statusCode == 404) {
      return throw Exception('Data User Tidak Ditemukan!');
    } else {
      return throw Exception("Ada kesalahan pada server!");
    }
  }
}

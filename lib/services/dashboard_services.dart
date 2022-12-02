part of 'services.dart';

class DashboardServices {
  static Future<List<Article>> getUserList() async {
    final reponse = await Dio().get('${urlElisoft}articles');
    final json = reponse.data;

    if (reponse.statusCode == 200) {
      List<Article> result =
          (json['data'] as Iterable).map((e) => Article.fromJson(e)).toList();

      return result;
    } else if (reponse.statusCode == 404) {
      return throw Exception('Data User Tidak Ditemukan!');
    } else {
      return throw Exception("Ada kesalahan pada server!");
    }
  }
}

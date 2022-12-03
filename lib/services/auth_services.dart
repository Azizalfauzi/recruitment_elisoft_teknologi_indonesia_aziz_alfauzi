part of 'services.dart';

class AuthServices {
  static Future<LoginModel> loginApp(
    String email,
    String password,
  ) async {
    String apiURL = "https://demo.treblle.com/api/v1/auth/login";

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    var body = json.encode({
      "email": email,
      "password": password,
    });

    var apiResult = await http.post(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );

    if (apiResult.statusCode == 200) {
      var response = json.decode(apiResult.body);
      LoginModel result = LoginModel.fromJson(response);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('name', result.user.name);
      return result;
    } else if (apiResult.statusCode == 400) {
      return throw Exception("User tidak ditemukan!");
    } else if (apiResult.statusCode == 401) {
      return throw Exception("Password salah!");
    } else {
      return throw Exception(
          'Ada kesalahan pada server!\nGagal melakukan login!');
    }
  }

  /// Logout Method
  static Future<void> signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('name');
  }
}

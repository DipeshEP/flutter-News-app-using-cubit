import 'dart:convert';

import 'package:http/http.dart';
import 'package:loginform/src/models/user.dart';
class ApiHelper {
  static final ApiHelper _instance = ApiHelper.internal();

  factory ApiHelper() => _instance;
  ApiHelper.internal();
  static const _BASE_URL = "https://saurav.tech/";

  Future<dynamic> getRequest(String route) async {
    String url = _BASE_URL + route;
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("....") ;
      }
    } catch (ex) {
      throw Exception("....");
    }
  }
}

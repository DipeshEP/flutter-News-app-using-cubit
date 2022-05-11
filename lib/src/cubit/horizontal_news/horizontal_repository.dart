import 'package:loginform/src/models/api_helper.dart';
import 'package:loginform/src/models/user.dart';

class HorizontalRepository {
  Future<User>fetNews()async{
    String route="NewsAPI/everything/cnn.json";
    var response =await ApiHelper.internal().getRequest(route);
    return response;
  }
}

import 'package:loginform/src/models/api_helper.dart';
import 'package:loginform/src/models/user.dart';

class NewsRepository{
  Future<User>fetchNews() async{
    String route='NewsAPI/everything/cnn.json';
    var response=await ApiHelper.internal().getRequest(route);
     return response;

  }

}

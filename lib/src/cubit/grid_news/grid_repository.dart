

import 'package:loginform/src/models/api_helper.dart';
import 'package:loginform/src/models/user.dart';

class GridRepository{
  Future<User>fetchNews()async{
    const route="NewsAPI/everything/cnn.json";
    var response= await ApiHelper.internal().getRequest(route);
    return response;
  }
}

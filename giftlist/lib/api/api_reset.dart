import 'dart:convert';
import 'package:giftlist/api/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:giftlist/api/user_model.dart';

class ApiReset{
  static Future<ApiResponse<User>> reset(String email,String password,String token) async{
    final url = 'http://app-apiusers.herokuapp.com/auth/reset_password';

    Map<String,String> headers = {
      "Content-type": "application/json"
    };

    Map params = {
      "email": email,
      "password": password,
      "token": token,
    };

    String s = json.encode(params);

    final response = await http.post(url, body: s, headers: headers);

    Map mapResponse = json.decode(response.body);

    final user = User.reset(mapResponse);

    if(response.statusCode == 200){
      return ApiResponse.ok(user);
    }

    return ApiResponse.error("error");
  }
}
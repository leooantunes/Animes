import 'dart:convert';
import 'package:giftlist/api/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:giftlist/api/user_model.dart';

class ApiCadastro{
  static Future<ApiResponse<User>>cadastro(String email, String name, String password) async{
    final url = 'http://app-apiusers.herokuapp.com/auth/register';

    Map<String,String> headers = {
      "Content-type": "application/json"
    };

    Map params = {
      "email": email,
      "name": name,
      "password": password,
    };

    String s = json.encode(params);

    final response = await http.post(url, body: s, headers: headers);

    Map mapResponse = json.decode(response.body);

    final user = User.cadastro(mapResponse);

    if(response.statusCode == 200){
      return ApiResponse.ok(user);
    }

    return ApiResponse.error("error");

  }
}
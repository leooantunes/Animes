import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:giftlist/api/user_model.dart';

class ApiReset{
  static Future<User> reset(String email,String password,String token) async{
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

    String login = mapResponse["email"];
    String senha = mapResponse["password"];
    String codigo = mapResponse["token"];

    final user = User.reset(login,senha,codigo);

    if(response.statusCode == 200){
      return user;
    }else{
      print("erro de login");
    }
  }
}
import 'dart:convert';
import 'package:giftlist/api/post_model.dart';
import 'package:http/http.dart' as http;

class ApiAnime {
  static const BASE_URL = "https://api.jikan.moe/v3/";

  search(String search) async {
    http.Response response = await http
        .get("https://api.jikan.moe/v3/search/anime?q=$search&page=1");
    return decode(response);
  }

  AnimeModel decode(http.Response response) {
    try {
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);

      return AnimeModel.fromJson(decoded);
      }
      else {
        print('Erro get api anime ${response.body}');
      }
      
    }
    catch (e){
      print('Erro get api anime $e');
    }
    return null;
  }
}

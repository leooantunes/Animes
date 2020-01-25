import 'dart:async';
import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:giftlist/api/post_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteBloc implements BlocBase {

  Map<String,AnimeModel> _favAnime = {};

  final BehaviorSubject<Map<String,AnimeModel>> _favController = BehaviorSubject();
  Stream<Map<String,AnimeModel>> get outFav => _favController.stream;

  FavoriteBloc(){
    SharedPreferences.getInstance().then((prefs){
      if(prefs.getKeys().contains("favorites")){
        _favAnime = json.decode(prefs.getString("favorites")).map((k,v){
          return MapEntry(k,AnimeModel.fromJson(v));
        }
        ).cast<String,AnimeModel>();
        _favController.add(_favAnime);
      }
    });
  }

  void favorite(Results anime){
    if(_favAnime.containsKey(anime.title)){
      _favAnime.remove(anime.title);
    }else{
      _favAnime[anime.title] = anime as AnimeModel;
    }
    _favController.sink.add(_favAnime);
    _saveFav();
  }

  void _saveFav(){
    SharedPreferences.getInstance().then((prefs){
      prefs.setString("favorites", json.encode(_favAnime));
    });
  }

  @override
  void dispose() {
    _favController.close();
  }
  
}
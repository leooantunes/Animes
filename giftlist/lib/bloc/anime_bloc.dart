import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:giftlist/api/api_anime.dart';
import 'package:giftlist/api/post_model.dart';
import 'package:rxdart/rxdart.dart';

class AnimeBloc implements BlocBase{
  ApiAnime anime;
  AnimeModel animes;

  final BehaviorSubject <AnimeModel> _animeController = BehaviorSubject<AnimeModel>();
  Stream get outAnimes => _animeController.stream;

  final BehaviorSubject <String> _searchController = BehaviorSubject<String>();
  Sink get inSearch => _searchController.sink;


  AnimeBloc(){
    anime = ApiAnime();
    _searchController.stream.listen(_search);
  }

  void _search (String search) async{
    print(search);
    animes = await anime.search(search);
    print(animes ?? 'erro');
    _animeController.sink.add(animes);
    print(animes.results[1].title);
  }

  @override
  void dispose() {
    _animeController.close();
    _searchController.close();
  }

}


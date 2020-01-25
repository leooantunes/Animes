import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:giftlist/api/post_model.dart';
import 'package:giftlist/bloc/anime_bloc.dart';
import 'package:giftlist/screens/anime_search.dart';
import 'package:giftlist/tile/anime_tile.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: GradientAppBar(
        backgroundColorStart: Color.fromRGBO(231, 40, 74, 1),
        backgroundColorEnd: Color.fromRGBO(253, 146, 30, 1),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Container(
          child: Text("Anime List xD",style: TextStyle(color: Colors.white),),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,color: Colors.white,),
            onPressed: () async {
              String result =
                  await showSearch(context: context, delegate: AnimeSearch());
              if (result != null)
                BlocProvider.of<AnimeBloc>(context).inSearch.add(result);
            },
          ),
        ],
      ),
      body: Container(
        color: Color.fromRGBO(253, 146, 30, 1),
        alignment: Alignment.center,
        child: StreamBuilder(
          initialData: null,
          stream: BlocProvider.of<AnimeBloc>(context).outAnimes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  Results anime = snapshot.data.results[index];
                  return AnimeTile(
                    anime,
                  );
                },
              );
            } else {
              return CircularProgressIndicator(
                backgroundColor: Colors.white,
              );
            }
          },
        ),
      ),
    );
  }
}

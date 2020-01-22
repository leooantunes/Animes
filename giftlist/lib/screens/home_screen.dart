import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:giftlist/bloc/anime_bloc.dart';
import 'package:giftlist/screens/anime_search.dart';
import 'package:giftlist/tile/anime_tile.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text("Anime List xD"),
          color: Colors.orange,          
        ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () async{
            String result = await showSearch(context: context, delegate: AnimeSearch());
            if(result != null) BlocProvider.of<AnimeBloc>(context).inSearch.add(result);
          },
        ),
      ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<AnimeBloc>(context).outAnimes,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemBuilder: (context,index){
                return AnimeTile(snapshot.data[index]);
              },
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
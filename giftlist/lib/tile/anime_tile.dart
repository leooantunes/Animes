import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:giftlist/api/post_model.dart';
import 'package:giftlist/bloc/favorite_bloc.dart';

class AnimeTile extends StatelessWidget {
  final Results anime;

  AnimeTile(this.anime);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteBloc>(context);

    return Center(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      AspectRatio(
                        aspectRatio: 16.0 / 9.0,
                        child: Image.network(
                          anime.imageUrl,
                          height: 500,
                          width: 500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            anime.title,
                            textAlign: TextAlign.center,                           
                            style:
                                TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          StreamBuilder<Map<String, AnimeModel>>(
                              stream: bloc.outFav,
                              initialData: {},
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return IconButton(
                                    icon: Icon(
                                        snapshot.data.containsKey(anime.title)
                                            ? Icons.star
                                            : Icons.star_border),
                                    color: Colors.white,
                                    iconSize: 30,
                                    onPressed: () {
                                      bloc.favorite(anime);
                                    },
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              }),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      ),
                      Text(
                        anime.synopsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

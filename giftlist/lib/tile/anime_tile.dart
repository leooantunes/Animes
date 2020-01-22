import 'package:flutter/material.dart';
import 'package:giftlist/api/post_model.dart';

class AnimeTile extends StatelessWidget {
  final AnimeModel anime;

  AnimeTile(this.anime);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(
              anime.results[1].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    ),
                    Text(anime.results[1].title),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    ),
                    Text(anime.results[1].synopsis),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

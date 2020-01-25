import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:giftlist/api/post_model.dart';
import 'package:giftlist/bloc/favorite_bloc.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../api/post_model.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<FavoriteBloc>(context);

    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Color.fromRGBO(231, 40, 74, 1),
        backgroundColorEnd: Color.fromRGBO(253, 146, 30, 1),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Container(
          child: Text(
            "Meus Animes ^^", 
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: StreamBuilder<Map<String,Results>>(
        stream: bloc.outFav,
        builder: (context,snapshot){
          if (snapshot.data == null) {
            return Container();
          }

          return ListView(
            children: snapshot.data.values.map((a){
              return InkWell(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 50,
                      child: Image.network(a.imageUrl),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

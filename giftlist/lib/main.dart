import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:giftlist/bloc/anime_bloc.dart';
import 'package:giftlist/bloc/favorite_bloc.dart';
import 'package:giftlist/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: AnimeBloc(),
      child: BlocProvider(
        bloc: FavoriteBloc(),
        child: MaterialApp(
        title: 'Gift App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: LoginPage(),
      ),
      ),
    );
  }
}
